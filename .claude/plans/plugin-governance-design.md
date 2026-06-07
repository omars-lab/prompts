# Design: Plugin Governance (keep each repo's plugins in sync with what it should have)

**Status: DESIGN FOR APPROVAL — do not build until approved.** Part E of
[`parallel-seeking-catmull.md`](parallel-seeking-catmull.md). Supersedes Part 3 of
`REVIEW-AND-GOVERNANCE-PROMPT.md`.

## Problem

Keeping each repo's **installed + enabled** plugins in sync with the plugins that repo *should* have is
manual and silent-failure-prone:
- `enabledPlugins: true` on a **not-installed** plugin is a silent no-op — the capability just doesn't
  appear, with no error (we hit exactly this with the stale `documentation-manager` entry).
- The "install matrix" (which repo gets which plugins) lives only in a plan doc
  (`tender-dreaming-dolphin.md`), not anywhere a tool or hook can read.
- Nothing tells you at session start that a repo is missing its recommended plugins, or that an installed
  plugin is stale vs the marketplace.

## Grounding facts (verified this session)

- `discover-oeid-plugins:explore-plugins` **already** reads `~/.claude/plugins/known_marketplaces.json`
  and checks installed-plugin dirs at
  `~/.claude/plugins/marketplaces/oeid-claude-plugins/plugins/<name>/`. It is the natural foundation.
- `SessionStart` hooks with `matcher: "startup"` are a proven pattern in this setup (e.g.
  `earlbear-claude-agent/.claude/settings.json` → `verify-supabase.sh`); hook scripts live in
  `.claude/hooks/`.
- The marketplace now has **accurate** versions (Part D synced marketplace.json ↔ plugin.json and added a
  parity check), so version-based staleness detection is now trustworthy. `make version-check` is the
  per-plugin source of "is a bump pending"; for *installed-vs-registered* staleness, compare the installed
  plugin's version against marketplace.json.
- `enabledPlugins` is keyed `"<plugin>@<marketplace>": true` in `.claude/settings.json`.

## Design decisions

### 1. Home — extend `discover-oeid-plugins` (not a new plugin)

Add governance as **new skills inside `discover-oeid-plugins`**, because it already inspects marketplace
registration + install state. Avoids a new plugin to install/enable everywhere, and keeps all
"what plugins do I have / should I have" logic in one place.

- New skill **`reconcile-plugins`** — the apply/dry-run command (see §4).
- Extend **`explore-plugins`** (or a small shared guide) with the suggested-vs-actual comparison logic so
  both the skill and the hook script share one definition of "missing / not-enabled / stale".

Rejected alternatives: a brand-new `plugin-governance` plugin (extra install surface);
`config-manager` (it does env/dir setup, not plugin inventory); `claude-manager:manage-plugins` (that
evaluates/authors *marketplace* plugins, a different audience than per-repo enablement).

### 2. Suggested-plugins manifest — per-repo committed file

Convention: a committed **`.claude/suggested-plugins.json`** at each repo root:

```json
{
  "$schema": "oeid-suggested-plugins/v1",
  "plugins": [
    { "plugin": "document-co-author@oeid-claude-plugins", "required": true,
      "reason": "authoring blog posts + structured docs" },
    { "plugin": "code-repository-manager@oeid-claude-plugins", "required": false,
      "reason": "publish co-design docs to wiki/pages" }
  ]
}
```

- Committed (travels with the repo, reviewable, diffable) — beats a central matrix keyed by absolute path
  (breaks under the `~/workplace`→`~/Workspace` symlink) and beats pure category auto-detection (too
  magic; can't express intent/`reason`).
- Seed the categorized repos from the existing matrix: **blog** (`omars-lab.github.io`):
  document-co-author, code-repository-manager, architecture-manager, code-quality-manager,
  knowledge-manager; **work** (`workspace`): architecture-manager, code-repository-manager (+ the broader
  set already enabled there); **resume** (`personalbook`): profile-manager. (These are exactly the sets
  committed in Part C — so the manifests document what we just enabled.)
- **Cache**: a resolved/normalized copy at `~/.claude/plugins/.governance-cache/<repo-hash>.json` with an
  mtime check against the manifest, so the SessionStart hook does no JSON walking on the hot path when
  nothing changed. (Optional optimization; can ship v1 without it if startup stays fast.)

### 3. SessionStart hook — global, manifest-gated, non-blocking

One **global** hook in `~/.claude/settings.json` (`SessionStart`, `matcher: "startup"`) running a script
at `~/.claude/hooks/check-suggested-plugins.sh`. Logic:

1. If the cwd repo has no `.claude/suggested-plugins.json` → exit 0 immediately (manifest-gated: zero cost
   in non-opted repos).
2. Else compare the suggested set against:
   - **installed**: dir exists at `~/.claude/plugins/marketplaces/<mp>/plugins/<name>/`
   - **enabled**: `"<plugin>@<mp>": true` present in the repo's `.claude/settings.json` `enabledPlugins`
   - **stale**: installed plugin's version < marketplace.json version
3. Print a concise, **non-blocking** report (stdout, exit 0 always):
   ```
   ⚠ plugin governance: 1 missing, 1 not-enabled, 1 stale
     missing:     foo@oeid-claude-plugins   → claude plugin install foo@oeid-claude-plugins
     not-enabled: bar@oeid-claude-plugins   → enable in .claude/settings.json (or: claude plugin enable …)
     stale:       baz@oeid-claude-plugins 1.1.0<1.3.0 → claude plugin update baz@oeid-claude-plugins
   ```
- Hard requirements: **≤ ~1–2s**, **never blocks** (always exit 0, never prompt), pure read-only.
  Global + manifest-gated beats a per-repo hook (no per-repo wiring; behavior only activates where a
  manifest exists).

### 4. `reconcile-plugins` skill — idempotent, dry-run by default

Given a repo, it:
1. Reads `.claude/suggested-plugins.json`.
2. **Dry-run by default**: prints the same missing/not-enabled/stale report plus the exact commands.
3. With apply (confirmed): `claude plugin install` the missing (correct scope), add the `@mp: true` keys
   to that repo's `.claude/settings.json` `enabledPlugins`, and flag stale ones for
   `claude plugin update` (surface the hint; do **not** auto-update).
4. Optional `--prune`: report enabled-but-not-suggested entries (don't auto-remove).
5. **Other-repo safety**: if the target repo isn't the cwd repo, `AskUserQuestion` before writing — same
   rule we followed for the Part C commits.
6. Idempotent: re-running when already in sync makes no changes and says so.

### 5. Staleness definition

`stale` = installed/registered version `<` marketplace.json version for that plugin. Reuse the
now-accurate marketplace.json (Part D) and `claude plugin update` for the fix. Surface a one-line upgrade
hint; never auto-update. (`make version-check` remains the *authoring-side* signal for whether a plugin
needs a version bump — distinct from this *consumer-side* staleness.)

### 6. Validation / tests (headless-safe)

- A `make` target or skill self-check that runs the comparison against a **fixture** manifest + fixture
  install/known_marketplaces JSON (no live `~/.claude`, no interactive auth), asserting the
  missing/not-enabled/stale classification. Headless-safe so it runs in cron/CI.
- The hook script gets a `--self-test` mode that points at fixtures and asserts exit 0 + expected output.
- `evaluate-skill` on `reconcile-plugins`, `evaluate-plugin` on `discover-oeid-plugins` after the change;
  bump `discover-oeid-plugins` (minor) and sync marketplace.json (the new parity check enforces it).

## Synergy with Part D

Governance staleness detection depends on marketplace.json versions being accurate — which Part D
established (the sync) and the new validator parity check (D3) keeps true going forward. The two pieces
are deliberately complementary.

## Build plan (only if approved)

1. Scaffold `reconcile-plugins` via `claude-manager:manage-skills` create-skill; extend `explore-plugins`
   with the shared comparison guide. Generalize all paths.
2. Write `~/.claude/hooks/check-suggested-plugins.sh` (manifest-gated, fast, exit-0) + the `--self-test`
   fixtures.
3. Seed `.claude/suggested-plugins.json` in the 3 categorized repos (blog/work/resume) from the matrix
   (other-repo writes → confirm each).
4. `evaluate-skill` / `evaluate-plugin`; bump `discover-oeid-plugins`; `make validate-plugins` +
   `make version-check` green; publish via `make sync-remote`.
5. Wire the global SessionStart hook into `~/.claude/settings.json` (and optionally document it for the
   matrix repos).

## Definition of done (build phase)

- `discover-oeid-plugins` passes `evaluate-plugin`; new `reconcile-plugins` passes `evaluate-skill`.
- SessionStart hook reports missing/stale/not-enabled non-blockingly and fast; exits 0 always; no-ops
  where no manifest exists.
- `suggested-plugins.json` seeded for blog/work/resume (matching what Part C enabled).
- Headless-safe self-test passes; marketplace validation green; published via `make sync-remote`.
