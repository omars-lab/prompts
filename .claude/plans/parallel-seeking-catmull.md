# Plan: Finish Reconciliation, Harden Marketplace, Commit Install Matrix, Design Governance

## Context

The `prompts` catalog was retired into **oeid-claude-plugin-marketplace**. File-level migration and
paragraph-level reconciliation of the original 24 dropped files are done and published. This plan closes
out everything deliberately deferred, driven by `FINISH-REMAINING-WORK-PROMPT.md`.

**Crucially, verification surfaced facts the prompt got wrong or didn't know** — these reshape the work:

| Prompt claimed | Reality found |
|---|---|
| `oeid-noteplan-quicknote` "missing plugin.json" | It HAS `plugin.json` at its root — but it's a **NotePlan app plugin** (`noteplan.minAppVersion`, `jsFunction`, `script.js`), not a Claude Code plugin, and isn't registered in marketplace.json. The validator only looks in `.claude-plugin/`, so it mis-categorizes it. |
| Only `document-co-author` version-tracking might be off | **Marketplace-wide drift**: `marketplace.json` says ~`1.0.0` for ~18 plugins while their `plugin.json` has advanced (claude-manager 2.4.0, code-quality-manager 2.2.0, etc.). 5 plugins have `versionCommit 77fb986` = "not in git history". `make version-check` flags 15 plugins. |
| omars-lab.github.io edits uncommitted on `blog/what-does-gtm-mean` | Edits are **STASHED** (`stash@{0}`), repo is on `master`, and the stash bundles unrelated work (3 blog posts, package.json, .gitignore). |
| workspace adds "+2 plugins" | workspace settings.json is a **full restructure** (reordered keys, expanded permissions w/ make/brew/git + `defaultMode:auto`, new `extraKnownMarketplaces` block, full enabledPlugins rewrite incl. the broken `documentation-manager`). |
| `evaluate-skill`/`evaluate-plugin` are Make targets | No such targets. Validation is `make validate-plugins` + `make version-check`; "evaluate-skill/plugin" are skills (`claude-manager:manage-skills` / `manage-plugins`). |

**Already verified-good** (no action needed): the one completed migration (`heal/fix-frontmatter.md:165-220`
→ `document-co-author:import-structured-doc` `guides/section-template.md` §1) is consistent across
MIGRATED.md / NOT-MIGRATED.md / RECONCILE-LEDGER.md; the mirror is up to date (`make sync-remote-status`
= "Up to date", local `7a391e2`); the section-template enrichment has zero hardcoded paths.

**User decisions (from AskUserQuestion):**
- Version drift → **fix all now**; **plugin.json is the source of truth** → sync marketplace.json to plugin.json; repair broken versionCommits via `version-init`; **also add a validation hook** that catches marketplace.json↔plugin.json drift going forward.
- Quicknote → **make the validator skip non-Claude-Code plugins**.
- The three settings edits → **commit all three**, showing each diff and confirming before every commit.
- workspace → **commit the whole restructure, minus the broken `documentation-manager` ref**.
- Governance (Part E) → **plan it fully, build later** behind separate approval.

## Guardrails
- gitleaks pre-commit/pre-push hooks on both `prompts` and the marketplace — keep green.
- Marketplace `github` remote is a protected mirror — publish ONLY via `make sync-remote`, never `git push github`.
- `~/workplace`→`~/Workspace` symlink; treat each real repo once.
- Other-repo commits (omars-lab.github.io, workspace, personalbook) are outward-facing — show diff + confirm before each.

---

## Part A — Reconcile the 4 upstream prompts (paragraph-level method)

Files (all in `/Users/omareid/Workspace/git/prompts/`): `heal/fix-readmes.md` (208 L),
`author/data-structure-mental-model-guide.md` (422 L), `bootstrap/blog-posts.md` (175 L),
`heal/heal-blog-changelog.md` (368 L). They are flagged "Human review" in `RECONCILE-LEDGER.md` (lines 116-125).

For each: walk paragraph-groups, assign a verdict — **COVERED** `plugin:skill` / **PROJECT-BOUND** / **MIGRATE** — and append a section to `RECONCILE-LEDGER.md` mirroring the existing format.

Per-file starting hypotheses (verify before acting):
- **`heal/fix-readmes.md`** — folder-README-as-navigation-index authoring method. Confirmed NOT covered by `code-quality-manager:manage-docs` (audit/consolidate), `code-repository-manager:fix-doc-links` (`_category_.json` sidebars), or `update-docs` (wiki/Pages index files). **Likely MIGRATE** → enrich `code-quality-manager:manage-docs` with an "author folder README as navigation index" section (or a new `author-readme-index` sub-skill). Generalize the Docusaurus/`bytesofpurpose-blog/docs/` specifics.
- **`author/data-structure-mental-model-guide.md`** — 13-part data-structure mental-model template + LeetCode integration. Highly domain-specific (the blog's CS-notes vertical). Likely **PROJECT-BOUND** (or MIGRATE into a knowledge/authoring skill if a clean home exists) — decide during the walk.
- **`bootstrap/blog-posts.md`** — full blog-system bootstrap. Likely **PROJECT-BOUND** to the blog repo; check `bootstrap`/blog skills for overlap first.
- **`heal/heal-blog-changelog.md`** — git-history→changelog enrichment. Check existing changelog capability first: `plan-manager` (plan-changelog, "coming soon"), `architecture-manager` (`scripts/changelog_entry.py`), and the blog repo's own `changelog-archive-reminder` hook. Likely **PROJECT-BOUND** unless a generalizable method emerges → then MIGRATE.

For any **MIGRATE**:
1. Enrich the covering skill additively, paths generalized (use `claude-manager:manage-skills` update-skill as the method).
2. Run the `manage-skills` evaluate step on the skill; run `manage-plugins` evaluate-plugin on the plugin.
3. Bump the plugin (plugin.json + version-tracking via `make version-bump PLUGIN=<p> TYPE=minor`) and reflect the new version in marketplace.json (handled wholesale in Part D's sync, but bump the touched plugin explicitly).
4. Update `MIGRATED.md` (add to "Merged/folded" with mirror link).
5. Remove the now-empty source file from `prompts`.
6. `grep -rE 'omars-lab|bytesofpurpose|/Users/omareid|workplace/'` over the touched skill/guide → expect zero.

Commit in logical groups in each repo. Publish the marketplace via `make sync-remote` after marketplace edits.

---

## Part B — Remove the stale `documentation-manager` reference

`documentation-manager@oeid-claude-plugins` is in `workspace/.claude/settings.json` `enabledPlugins` and
**fails to load** ("not found in marketplace"). Confirmed: no `documentation-manager` plugin exists in
marketplace.json; closest live capability is `code-quality-manager:manage-docs`. **Remove the entry**
(don't repoint — `code-quality-manager` is already separately enabled in the same block). This folds into
the Part C workspace commit (the entry lives in the same uncommitted file).

---

## Part C — Commit the three install-matrix settings edits (confirm each)

Process for each: show the exact diff, confirm, commit on the right branch, never entangle unrelated changes.

1. **`personalbook`** (branch `master`) — clean `+profile-manager@oeid-claude-plugins`. Commit:
   `chore: enable profile-manager plugin`. Simplest; do first.

2. **`workspace`** (branch `main`) — commit the **whole settings.json restructure minus the
   `documentation-manager` line** (Part B). Steps: remove the `documentation-manager` entry, re-validate
   JSON, show final diff, commit: `chore: enable oeid plugins + harden settings`. Note: workspace has
   OTHER uncommitted files — stage ONLY `.claude/settings.json`.

3. **`projects/omars-lab.github.io`** — the change is **stashed** (`stash@{0}`) and bundled with unrelated
   blog work. Untangle: `git stash apply stash@{0}` (apply, don't pop — keep the stash as backup), then
   stage ONLY `.claude/settings.json`, commit on a dedicated branch (`chore/enable-oeid-plugins` off
   `master`) or as a standalone `chore: enable oeid plugins` commit — confirm branch choice with user at
   commit time. Leave the 3 blog posts + package.json + .gitignore changes in the working tree (do not
   commit them); drop the stash only after the settings commit is safe, or leave it as backup.

---

## Part D — Harden & validate (the big correctness pass)

### D1. Fix marketplace version drift (plugin.json = source of truth)
1. **Repair broken versionCommits**: 5 plugins (`architecture-manager`, `cron-manager`, `profile-manager`,
   `code-repository-manager`, `design-partner`) point at `77fb986` ("not in git history"). Run
   `./scripts/cli version-init oeid-claude-plugins` to reset all `version-tracking.json` `versionCommit`
   to current HEAD (it also migrates any legacy commit from plugin.json). Verify `make version-check` no
   longer reports "not in git history".
2. **Sync marketplace.json → plugin.json versions**: for every plugin, write its `plugin.json` `version`
   into the matching `marketplace.json` plugins[].version. ~18 entries change (claude-manager→2.4.0,
   code-quality-manager→2.2.0, etc.). Do NOT bump version numbers — just reflect reality. Verify with a
   re-run of the parity check (the script written in D3).

### D2. Make the validator skip non-Claude-Code plugins
Edit `scripts/validate-plugins.sh`: before validating a plugin dir, skip it if it's a non-Claude-Code
plugin. Detection: skip dirs whose root `plugin.json` contains NotePlan keys (e.g. `noteplan.minAppVersion`
or `plugin.script`) and which lack a `.claude-plugin/` dir — i.e. skip `oeid-noteplan-quicknote`. Emit an
informational "skipping non-Claude-Code plugin" line, not a failure. Re-run `make validate-plugins` → green.

### D3. Add a marketplace.json↔plugin.json parity validation hook (user-requested)
Add a check to `validate_plugin()` in `scripts/validate-plugins.sh`: read the plugin's `plugin.json`
version and its `marketplace.json` entry version; **fail** if they differ ("marketplace.json vN.N.N ≠
plugin.json vM.M.M — run sync"). This catches the drift class going forward. (Optional: a small
`make sync-marketplace-versions` helper that performs D1.2 programmatically; decide during build whether
to add it or keep the sync as a one-time scripted edit.) After D1+D2 this check passes for all plugins.

### D4. document-co-author version-tracking
After D1's `version-init`, `document-co-author`'s `versionCommit` points at a valid HEAD commit and its
marketplace.json (1.2.1) already matches plugin.json (1.2.1). Confirm via the D3 parity check. Run the
`manage-plugins` evaluate-plugin on `document-co-author` to confirm 1.2.1 is clean.

### D5. Link & consistency audit (Part 2 of prompt)
1. Sample-verify 2-3 `MIGRATED.md` destination links resolve on the mirror's `main` (mirror is synced;
   use `make sync-remote-lookup` to map local→github SHA, or fetch the GitHub URLs read-only).
2. Confirm `MIGRATED.md` + `NOT-MIGRATED.md` + `RECONCILE-LEDGER.md` mutually consistent — every dropped
   file accounted for; the one migration appears in all three (already verified ✓ — re-confirm after Part A
   appends new ledger sections / any new MIGRATE).
3. `grep -rE 'omars-lab|bytesofpurpose|/Users/omareid|workplace/'` over any skill/guide touched in A or D
   → expect zero.

### D6. Publish & verify clean
After all marketplace edits (A migrations + D1/D2/D3): `make validate-plugins` green, `make version-check`
clean (or only intended bumps), then `make sync-remote`; confirm `make sync-remote-status` = up to date.

---

## Part E — Design plugin governance (PLAN ONLY; build behind separate approval)

Deliver a written design (do NOT scaffold/build this session). Reuse Part 3 of
`REVIEW-AND-GOVERNANCE-PROMPT.md`. The design must answer:

1. **Home** — recommend extending **`discover-oeid-plugins`** (it already inspects
   `~/.claude/plugins/known_marketplaces.json` + installed-plugin dirs) with a new
   `sync-plugins`/`reconcile-plugins` skill, vs. a brand-new `plugin-governance` plugin. Lean: extend
   `discover-oeid-plugins` (lowest friction, capability already adjacent) + a global SessionStart hook.
2. **Suggested-plugins manifest** — per-repo `.claude/suggested-plugins.json`:
   `[{plugin:"name@marketplace", required:bool, reason:"…"}]`. Seed from the existing install matrix
   (`tender-dreaming-dolphin.md`) for blog/work/resume. Plus a resolved-suggestions cache for hook speed.
3. **SessionStart hook** (`matcher:"startup"`, proven pattern) — global hook in `~/.claude/settings.json`,
   manifest-gated: if `.claude/suggested-plugins.json` exists, compare suggested vs installed+enabled, and
   **non-blockingly** print "missing: X; not-enabled-but-installed: Y; stale: Z" + exact
   `claude plugin install/enable` commands. Must be ≤ a couple seconds, cache-backed, never block startup.
4. **Reconcile/apply skill** — idempotent, dry-run by default: installs missing (right scope), enables in
   `.claude/settings.json`, flags stale for `claude plugin update`, optional prune; asks before writing to
   other repos.
5. **Staleness** — "installed/registered version < marketplace version"; reuse the now-accurate
   marketplace.json versions (Part D) + `make version-check`; surface a one-line hint, never auto-update.
6. **Validation/tests** — headless-safe tests for hook + skill (no interactive auth); a `make` target or
   skill self-check. Note the **synergy with D3**: governance staleness detection depends on marketplace.json
   versions being accurate, which Part D establishes and the new parity hook keeps true.

Output the design into this plan / a design doc and stop for approval before any build.

---

## Sequencing
1. **C.1 personalbook** (quick, clean) → 2. **B+C.2 workspace** → 3. **C.3 omars-lab** (untangle stash) —
   all other-repo, confirm each diff.
4. **A** reconcile 4 prompts (medium; method-driven) — marketplace edits if any MIGRATE.
5. **D1–D4** marketplace drift fix + validator changes (the heavy correctness work).
6. **D5–D6** audit, then `make sync-remote`.
7. **E** write governance design → stop for approval.

## Verification (end-to-end)
- `cd oeid-claude-plugin-marketplace && make validate-plugins` → all green (quicknote skipped, parity passes).
- `make version-check` → no "not in git history"; no unexpected drift.
- `make sync-remote-status` → "Up to date" after `make sync-remote`.
- `git status` in `prompts` and the marketplace → clean; gitleaks hooks pass on commit.
- The 4 upstream prompt files: reconciled (ledger extended; any MIGRATE removed from `prompts` + linked in MIGRATED.md).
- `grep -rE 'omars-lab|bytesofpurpose|/Users/omareid|workplace/'` over touched skills/guides → zero.
- Other-repo commits: each shown + confirmed; only `.claude/settings.json` staged; unrelated work untouched.
- `documentation-manager` no longer in any enabledPlugins.
- Part E: design written, approval pending (no build).

## Files / key locations
- Prompts to reconcile: `prompts/{heal/fix-readmes.md, author/data-structure-mental-model-guide.md, bootstrap/blog-posts.md, heal/heal-blog-changelog.md}`
- Ledgers: `prompts/{RECONCILE-LEDGER.md, MIGRATED.md, NOT-MIGRATED.md}`
- Validator: `oeid-claude-plugin-marketplace/scripts/validate-plugins.sh` (D2 skip + D3 parity check)
- Version tooling: `oeid-claude-plugin-marketplace/scripts/cli` (`version-init`, `version-bump`), `Makefile`
- Registry: `oeid-claude-plugin-marketplace/.claude-plugin/marketplace.json` (D1.2 version sync)
- Migrate target (likely): `oeid-claude-plugin-marketplace/plugins/code-quality-manager/skills/manage-docs/`
- Other-repo settings: `personalbook/.claude/settings.json`, `workspace/.claude/settings.json`, `projects/omars-lab.github.io/.claude/settings.json` (stash@{0})
- Governance home (proposed): `oeid-claude-plugin-marketplace/plugins/discover-oeid-plugins/`
