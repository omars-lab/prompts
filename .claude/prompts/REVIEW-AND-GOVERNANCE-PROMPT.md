# Prompt: Close Out the Reconciliation, Review the Setup, and Design Plugin Governance

Paste this into a **fresh session** to (1) finish the loose ends from the reconciliation phase, (2) review that what we did is actually wired up correctly and add any missing validation/hooks, and (3) design + (if approved) build a plugin-governance capability that keeps every repo's installed plugins in sync with what that repo should have.

Work in **plan mode first** — produce a plan, get it approved, then execute. Both `prompts` and `oeid-claude-plugin-marketplace` have gitleaks pre-commit/pre-push hooks; the marketplace's `github` remote is a **protected mirror** (publish only via `make sync-remote`, never push directly).

---

## Context you're inheriting

The `prompts` catalog was retired into **oeid-claude-plugin-marketplace**. Two passes are done:
1. **File-level migration** (plan: `.claude/plans/tender-dreaming-dolphin.md`) — 11 migrated, 4 folded, 24 dropped. Map in `MIGRATED.md` / `NOT-MIGRATED.md`.
2. **Paragraph-level reconciliation** (plan: `.claude/plans/linked-sleeping-hanrahan.md`) — all 24 dropped files walked paragraph-by-paragraph; audit trail in **`RECONCILE-LEDGER.md`**. 23 files were fully covered/project-bound and removed; 1 paragraph (legacy-frontmatter map) was migrated into `document-co-author:import-structured-doc` (`guides/section-template.md` §1). Marketplace bumped to `document-co-author` 1.2.1 and published to the mirror; the `prompts` branch was merged to `main`.

During that merge, **upstream had diverged** and brought in new/changed prompts that are *out of the original 24-file scope* and were intentionally **kept, not reconciled** (listed in `RECONCILE-LEDGER.md` → "Human review"). An **install matrix** was partially applied: blog (`projects/omars-lab.github.io`), work vault (`workspace/`), and resume repo (`personalbook`) had `enabledPlugins` updated and the 4 missing plugins installed at user scope — but **those three `.claude/settings.json` edits were left uncommitted** (the blog repo is mid-feature-branch; the others have unrelated in-flight changes).

Key environment facts (verify, don't trust blindly):
- `~/workplace` → symlink to `~/Workspace`; `~/Workspace/git/omars-lab.github.io` → symlink to `projects/omars-lab.github.io`. Count each real repo once.
- Marketplace is registered with the CLI as `oeid-claude-plugins`, sourced from the local dir. `claude plugin list` shows only **installed** plugins; `enabledPlugins: true` on a *not-installed* plugin is a silent no-op — you must `claude plugin install` first.
- `SessionStart` hooks with `matcher: "startup"` are already used in some repos (e.g. `earlbear-claude-agent/.claude/settings.json` → `verify-supabase.sh`). Hook scripts live in `.claude/hooks/`.
- `discover-oeid-plugins:explore-plugins` already knows how to check marketplace registration (`~/.claude/plugins/known_marketplaces.json`) and installed-plugin dirs (`~/.claude/plugins/marketplaces/oeid-claude-plugins/plugins/<name>/`). It's the natural foundation to extend.

---

## Part 1 — Finish the three open items

### 1a. Reconcile the new/changed upstream prompts (out-of-scope from the 24)
Apply the **same paragraph-level method** (verdict each paragraph: COVERED `plugin:skill` / PROJECT-BOUND / MIGRATE) and extend `RECONCILE-LEDGER.md`. Files (all currently kept on `prompts` `main`):
- `heal/fix-readmes.md` — upstream replaced the deleted 1-line stub with a substantial **209-line "folder-README-as-navigation-index" authoring method** (frontmatter + intent + distinction-from-siblings + "What You'll Find Here" + recursive child-README linking + quality checklist). Pre-checked: **not** covered by `code-quality-manager:manage-docs`/`improve-docs` (those audit/consolidate, don't prescribe this index pattern) or `code-repository-manager:fix-doc-links` (that's `_category_.json` sidebar files, not prose READMEs). Likely a real MIGRATE → enrich `manage-docs` (or a new `author-readme-index` sub-skill); generalize the Docusaurus-specific examples.
- `author/data-structure-mental-model-guide.md` — unreviewed.
- `bootstrap/blog-posts.md` — unreviewed.
- `heal/heal-blog-changelog.md` — unreviewed (note: there may be an adjacent changelog hook/skill already; check before migrating).
For any MIGRATE: enrich the covering skill (additive, paths generalized) via `claude-manager:manage-skills` update-skill, run `evaluate-skill`, bump the plugin + marketplace.json version, keep `manage-plugins evaluate-plugin` clean, update `MIGRATED.md`, then remove the now-empty source file. Commit in logical groups; publish the marketplace via `make sync-remote`.

### 1b. Remove the stale plugin reference
`workspace/.claude/settings.json` enables `documentation-manager@oeid-claude-plugins`, which **fails to load** ("not found in marketplace") — it predates this work. Either remove the entry or, if the capability still exists under a renamed plugin, repoint it. Confirm against the marketplace's actual plugin list. (This file also had unrelated edits land in it — only touch the stale entry; don't entangle.)

### 1c. Commit the three install-matrix settings edits (or back them out)
`projects/omars-lab.github.io`, `workspace/`, `personalbook` each have an uncommitted `.claude/settings.json` `enabledPlugins` change (applied + CLI-validated). Decide per repo: commit on an appropriate branch (the blog repo is on `blog/what-does-gtm-mean` — probably wants its own `chore: enable oeid plugins` commit or a separate branch, not entangled with blog content), or revert if the matrix should be delivered differently (see Part 3 — a governance plugin might make per-repo `enabledPlugins` edits unnecessary). **These are other repos — confirm before committing into them.**

---

## Part 2 — Review the work & harden the setup

Audit what we did and add validation where it's missing:
1. **Link integrity** — every destination link in `MIGRATED.md` now points at the mirror's `main` branch. Verify a sample actually resolves on GitHub (the mirror was synced). Confirm `RECONCILE-LEDGER.md` line ranges still match the files in git history.
2. **No-orphan check** — confirm `MIGRATED.md` + `NOT-MIGRATED.md` + `RECONCILE-LEDGER.md` are mutually consistent (every dropped file accounted for; the one migration appears in all the right places).
3. **Marketplace health** — `make validate-plugins` currently fails on an **unrelated** plugin: `oeid-noteplan-quicknote` is missing `plugin.json` (pre-existing). Decide whether to fix it (so the validator is green end-to-end) or document it as known. Re-run `evaluate-plugin` on `document-co-author` to confirm 1.2.1 is clean.
4. **Version-tracking** — `plugins/*/.claude-plugin/version-tracking.json` holds a `versionCommit` hash. Check whether the manual 1.2.1 bump should have updated `document-co-author`'s, and whether `make sync-remote`/version tooling already handled it. Fix if stale.
5. **Generalization** — `grep -rE 'omars-lab|bytesofpurpose|/Users/omareid|workplace/' ` over any skill/guide touched → expect zero (the enriched `section-template.md` already passed).

---

## Part 3 — Design (and, if approved, build) plugin governance

The motivating problem (the user's): keeping each repo's **installed/enabled** plugins in sync with the plugins that repo *should* have is manual and error-prone — `enabledPlugins` silently no-ops if the plugin isn't installed, the install matrix lives only in a plan doc, and nothing reminds you at session start that a repo is missing its recommended plugins or that installed plugins are stale.

Design a **globally-installed governance capability**. Evaluate these design questions in the plan (use `AskUserQuestion` for the genuine forks):

1. **Home** — a **new plugin** (e.g. `plugin-governance` / `repo-plugin-sync`) vs. extending an existing one (`discover-oeid-plugins` already inspects marketplace + install state; `config-manager` already does `setup-dev-env`/`setup-working-dirs`; `claude-manager:manage-plugins` already evaluates/fixes plugins). Recommend one, with rationale.
2. **Suggested-plugins manifest** — define a per-repo convention (no convention exists yet). Options: a committed file (e.g. `.claude/suggested-plugins.json` listing `plugin@marketplace` + reason + required/optional), or a central matrix (the one in `tender-dreaming-dolphin.md`) keyed by repo path/category, or category auto-detection (Docusaurus → blog set, has servicenow → work set, etc.). Consider a **cache** of resolved suggestions per repo so the hook is fast.
3. **SessionStart hook** — a `matcher: "startup"` hook (proven pattern) that: reads the repo's suggested set, compares against installed+enabled state (the dir/JSON checks `discover-oeid-plugins` already documents), and **non-blockingly** reports "missing: X, Y; stale: Z; not-enabled-but-installed: W" with the exact `claude plugin install/enable` commands to fix. Must be fast (≤ a few seconds), cache-backed, and never block startup. Decide: global hook (in `~/.claude/settings.json`, applies everywhere) vs. per-repo hook (only where a manifest exists). A global hook + manifest-gated behavior is likely best.
4. **Reconcile/apply command** — a skill that, given a repo, installs missing suggested plugins (right scope), enables them in `.claude/settings.json`, flags stale ones for `claude plugin update`, and optionally prunes. Idempotent; dry-run by default; asks before writing to other repos.
5. **Staleness** — define "stale" (installed version < marketplace version). Reuse `claude plugin update` / the marketplace's `version-check` Make target; surface a one-line upgrade hint rather than auto-updating.
6. **Validation/tests** — how to test the hook + skill without depending on interactive auth (headless-safe), plus a `make` target or skill self-check.

If the plan is approved, build it: scaffold via `claude-manager:manage-skills` create-skill (or create-plugin), generalize all paths, `evaluate-skill`/`evaluate-plugin`, bump versions, publish via `make sync-remote`, then wire the SessionStart hook (globally and/or into the matrix repos) and seed `suggested-plugins` manifests for the already-categorized repos (blog/work/resume) from the existing matrix.

---

## Definition of done
- Parts 1a–1c resolved: new upstream prompts reconciled (ledger extended; any migration linked in MIGRATED.md), stale `documentation-manager` ref gone, the 3 settings edits committed (or intentionally backed out) — other-repo commits confirmed first.
- Part 2 audit complete: links resolve, docs mutually consistent, marketplace validation green (or the one pre-existing failure explicitly documented), version-tracking correct, zero hardcoded paths in touched skills.
- Part 3: a plan for the governance capability is approved; if built, the plugin passes `evaluate-plugin`, the SessionStart hook reports missing/stale plugins non-blockingly and fast, suggested-plugins manifests seeded for the categorized repos, everything committed and the marketplace published via `make sync-remote`.
- Both repos' trees clean, hooks green, changes pushed.
