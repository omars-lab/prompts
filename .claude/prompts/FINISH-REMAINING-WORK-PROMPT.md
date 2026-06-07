# Prompt: Plan & Finish All Remaining Reconciliation / Setup Work

Paste this into a **clean new session**. The prompts→marketplace reconciliation is done and pushed; this prompt closes out everything that was deliberately deferred. **Work in plan mode first** — produce a plan, get it approved, then execute.

Guardrails (verify, don't trust blindly):
- Both `prompts` and `oeid-claude-plugin-marketplace` have **gitleaks** pre-commit/pre-push hooks.
- The marketplace's `github` remote is a **protected mirror** — publish only via `make sync-remote`, never `git push github`.
- `~/workplace` → symlink to `~/Workspace`; `~/Workspace/git/omars-lab.github.io` → symlink to `projects/omars-lab.github.io`. Treat each real repo once.
- `claude plugin list` shows only **installed** plugins. `enabledPlugins: true` on a *not-installed* plugin is a silent no-op — `claude plugin install` first.
- Editing/committing in **other repos is outward-facing** — confirm before committing into them.

---

## Inherited context (what's already done)

- File-level migration: plan `.claude/plans/tender-dreaming-dolphin.md`; map in `MIGRATED.md` / `NOT-MIGRATED.md`.
- Paragraph-level reconciliation: plan `.claude/plans/linked-sleeping-hanrahan.md`; audit trail in `RECONCILE-LEDGER.md`. All original 24 dropped files removed; one paragraph (legacy-frontmatter map) migrated into `document-co-author:import-structured-doc` (`guides/section-template.md` §1). Marketplace bumped to `document-co-author 1.2.1`, published to mirror. `prompts` branch merged to `main`; both repos clean/pushed.
- A broader design prompt already exists at `.claude/prompts/REVIEW-AND-GOVERNANCE-PROMPT.md` — **this prompt supersedes/consolidates it**; reuse its Part 3 (governance) verbatim where helpful.

---

## Remaining work (group into a plan, then execute)

### A. Reconcile the new/changed upstream prompts (out of the original 24)
These landed via the merge and are currently kept on `prompts` `main`, unreconciled. Apply the **same paragraph-level method** (each paragraph-group → COVERED `plugin:skill` / PROJECT-BOUND / MIGRATE), extend `RECONCILE-LEDGER.md`, and for any MIGRATE enrich the covering skill (additive, paths generalized) → `evaluate-skill` → bump plugin + `marketplace.json` version → `evaluate-plugin` clean → update `MIGRATED.md` → remove the emptied source file → publish via `make sync-remote`.

- `heal/fix-readmes.md` — substantial 209-line **folder-README-as-navigation-index** authoring method. Pre-checked: NOT covered by `code-quality-manager:manage-docs`/`improve-docs` (audit/consolidate, not this index pattern) nor `code-repository-manager:fix-doc-links` (sidebar `_category_.json`, not prose READMEs). **Likely a real MIGRATE** → enrich `manage-docs` or add an `author-readme-index` sub-skill; generalize Docusaurus-specific examples.
- `author/data-structure-mental-model-guide.md` — unreviewed.
- `bootstrap/blog-posts.md` — unreviewed.
- `heal/heal-blog-changelog.md` — unreviewed; check for an existing changelog hook/skill first (the blog repo has a `changelog-archive-reminder` hook).

### B. Remove / repoint the stale plugin reference
`workspace/.claude/settings.json` enables `documentation-manager@oeid-claude-plugins`, which **fails to load** ("not found in marketplace") — predates this work. Remove it, or repoint if the capability was renamed. Confirm against the marketplace's actual plugin list. (Note: that file's whole `enabledPlugins` block currently shows as modified in the working tree — see C; diff carefully, touch only what's intended.)

### C. Commit (or back out) the three install-matrix `settings.json` edits
All applied + CLI-validated, currently **uncommitted**. Confirm intent per repo before committing into them:
- `projects/omars-lab.github.io` (branch `blog/what-does-gtm-mean`) — adds: document-co-author, code-repository-manager, architecture-manager, code-quality-manager, knowledge-manager. *Mid-feature-branch* → probably its own `chore: enable oeid plugins` commit or a dedicated branch, not entangled with blog content.
- `workspace` (main) — adds architecture-manager + code-repository-manager (but the whole `enabledPlugins` block reads as modified — diff before committing).
- `personalbook` (master) — adds profile-manager.
Alternatively, **back these out** if Part E's governance approach should deliver per-repo plugin sets instead of hand-edited `enabledPlugins`. Decide holistically with E.

### D. Review & harden the completed work
1. Sample-verify `MIGRATED.md` destination links resolve on the mirror's `main`.
2. Confirm `MIGRATED.md` + `NOT-MIGRATED.md` + `RECONCILE-LEDGER.md` are mutually consistent (every file accounted for; the one migration appears in all three).
3. `make validate-plugins` currently fails on an **unrelated, pre-existing** plugin — `oeid-noteplan-quicknote` missing `plugin.json`. Fix it (so the validator is green) or document as known.
4. Check `plugins/document-co-author/.claude-plugin/version-tracking.json` `versionCommit` — confirm the manual 1.2.1 bump's tracking is correct (or that sync tooling handled it).
5. `grep -rE 'omars-lab|bytesofpurpose|/Users/omareid|workplace/'` over any skill/guide touched → expect zero.

### E. Design (and if approved, build) plugin governance
The motivating problem: keeping each repo's installed/enabled plugins in sync with what it *should* have is manual and silent-failure-prone. **Reuse Part 3 of `.claude/prompts/REVIEW-AND-GOVERNANCE-PROMPT.md`** — it details the design questions (home: new plugin vs. extend `discover-oeid-plugins`/`config-manager`/`claude-manager:manage-plugins`; per-repo `suggested-plugins` manifest + cache; a `SessionStart matcher:"startup"` hook that non-blockingly reports missing/stale/not-enabled plugins with exact fix commands; an idempotent dry-run reconcile skill; staleness via `claude plugin update`/`version-check`; headless-safe tests). Decide C in light of E (a governance manifest may replace hand-edited `enabledPlugins`).

---

## Suggested sequencing
B + C are quick and low-risk (do first, with confirmation). A is method-driven (medium). D is verification. E is the big design+build (plan-gate it separately; build only if approved). Commit in logical groups; keep gitleaks green; publish the marketplace via `make sync-remote`; confirm before any other-repo commit.

## Definition of done
- A: all four upstream prompts reconciled (ledger extended; migrations linked in MIGRATED.md and published).
- B: stale `documentation-manager` ref gone/repointed.
- C: the three settings edits committed (confirmed per repo) or intentionally backed out.
- D: links resolve, three docs consistent, marketplace validation green (or the pre-existing failure documented), version-tracking correct, zero hardcoded paths.
- E: governance plan approved; if built — passes `evaluate-plugin`, SessionStart hook works fast + non-blocking, manifests seeded for categorized repos, published via `make sync-remote`.
- Both repos clean, committed, hooks green, pushed.
