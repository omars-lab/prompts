# Plan: Paragraph-Level Reconciliation & Retirement of the 24 Not-Migrated Prompts

## Context

The `prompts` catalog is being retired into the **oeid-claude-plugin-marketplace**. A first pass migrated 11 prompts + folded 4, and dropped 24 **at the file level** (recorded in `MIGRATED.md` / `NOT-MIGRATED.md`). Those 24 files still sit on disk. This phase does the finer, **paragraph-by-paragraph** pass the file-level drop skipped: a dropped file may still hide a sentence of guidance the covering skill genuinely lacks.

For each paragraph the verdict is exactly one of:
- **COVERED** — an existing `plugin:skill` already conveys this instruction as well or better → delete the paragraph.
- **PROJECT-BOUND** — pure hardcoded path/taxonomy/coordinates, no transferable instruction → delete, note in NOT-MIGRATED.md.
- **MIGRATE** — uncovered + transferable → enrich the covering skill (don't dilute it), then move the file's entry to MIGRATED.md.

Outcome: every one of the 24 files is removed (fully reconciled) or left only with explicitly human-flagged paragraphs; nothing is silently lost; touched skills pass `evaluate-skill`; both repos clean, committed, hooks green, marketplace synced.

This plan reflects a completed read of all 24 files and verification of the primary covering skills (`fix-filenames`, `manage-emojis`, `sweep-daily-notes`, `fix-doc-links` + `link-taxonomy.md`, `blog-post-structure.md` guide, `structure-role`, `refactor-resume-bullets`, `asking-what-if`).

## The audit ledger (how we track every paragraph)

Per the user's decision, the per-paragraph record lives in a **committed markdown ledger**, driven by coarse tracker tasks:

- **`RECONCILE-LEDGER.md`** (new, repo root) — one `- [ ]` line per paragraph-group:
  `- [ ] <file>:<startLine>-<endLine> — <VERDICT> (<plugin:skill / reason>)`
  Grouped by file. Boxes get ticked as each paragraph is reconciled. This is the durable audit artifact alongside MIGRATED.md / NOT-MIGRATED.md.
- **Task tracker** — coarse driver tasks only (not one per paragraph):
  - `Ledger: <file>` — populate the ledger rows for that file (verdict each paragraph-group).
  - `Reconcile: <file>` — execute deletions / stage migrations, tick the boxes, remove file if empty.
  - plus the cross-cutting tasks (skill enrichment, MIGRATED/NOT-MIGRATED updates, evaluate-skill, version bumps, install matrix, branch/sync).

A "paragraph-group" = a contiguous run of paragraphs (heading+body, a list, or a fenced block) sharing one verdict. Line numbers are from the current files.

## Per-file disposition (hypothesis from the completed read)

Verdicts below are the starting hypothesis written into the ledger; each is re-confirmed against the named skill at reconciliation time. **Expected end state: all 24 files removed** — no migration candidates survived the read except a few nuances to evaluate inline (flagged ⚠️).

### Fully COVERED → expect full removal
| File | Covered by |
|---|---|
| `analyze/review-code.md` | A raw review transcript (project paths, no instruction). `code-quality-manager:poke-holes`. |
| `analyze/deep-dive-into-code.md` | Stub: a bare `code.amazon.com` link. PROJECT-BOUND. |
| `brainstorm/ask-me.md` | `experiment-manager:asking-what-if` (guided-question method, more complete). |
| `heal/heal-noteplan-file-names.md` | `noteplan-manager:manage-filenames` → `fix-filenames` (golden rule, convention table, self-healing codified). |
| `heal/fix-emojis-used.md` | PROJECT-BOUND (one blog file + NotePlan personal path). Adjacent: `noteplan-manager:manage-emojis`. |
| `heal/fix-frontmatter.md` | Blog/docs frontmatter → `document-co-author/guides/blog-post-structure.md`; detection commands are project chores. ⚠️ check non-conforming map (165-220). |
| `heal/fix-readme-primary.md`, `heal/fix-readmes.md` | One-project README chores (hardcoded `omars-lab.github.io` tree). PROJECT-BOUND. |
| `heal/fix-portfolio.md` | One React portfolio's troubleshooting log. PROJECT-BOUND. |
| `organize/carry-over-daily-todos.md` | `noteplan-manager:sweep-daily-notes` (day-by-day, business-day/weekend routing, verbatim hierarchy-preserving moves, meeting extraction) + emoji taxonomy is PROJECT-BOUND. |
| `organize/tag-tasks.md` | `sweep-daily-notes` (`# [[PlanName]]` linking) + Amazon hashtag taxonomy PROJECT-BOUND. |
| `organize/organize-personal-todos.md`, `organize/organize-work-tasks.md` | Folder-map/taxonomy is the content → PROJECT-BOUND; generic routing covered by `sweep-daily-notes` / `knowledge-manager:meta-content-organizer`. |
| `commands/noteplan/generate-weekly-summary.md` | Stub; aggregation + hierarchy rules covered by `sweep-daily-notes`. |
| `rules/task-handling-rules.md` | `sweep-daily-notes` "indentation immutable / verbatim / no parent-child split" rules. |
| `draw/customize-kanban-board.md` | All value = hardcoded SVG coords for one file. PROJECT-BOUND. |
| `research/research-genai-arch-patterns.md` | `deep-research` harness (research→synthesize); URLs + findings are a one-off note. PROJECT-BOUND. |
| `refactor/role-refactoring-prompt.md` | `role-manager:structure-role` (1751 lines; supersedes). ⚠️ diff the 11 section-handlers for any nuance structure-role lacks. |
| `resume-prompts/check-resume.prompt.md`, `resume-prompts/point-extraction.prompt.md` | 1-2 line stubs; `profile-manager:refactor-resume-bullets`. |
| `author/blog-post-structure.md` | `document-co-author/guides/blog-post-structure.md`. ⚠️ check "I need to…" Purpose format + Action-Items section. |
| `plans/broken-links-resolution-plan.md` | One-off output; root-cause categories covered by `fix-doc-links/guides/link-taxonomy.md` (all 8 categories incl. cache edge-case). |
| `plans/seo-improvement-plan.md` | One-off SEO deliverable for one blog/domain. PROJECT-BOUND / ONE-OFF. |
| `solve/solve-leetcode-and-teach.md` | 2-line concept stub. STUB. |

### ⚠️ Paragraphs to evaluate inline (the only MIGRATE candidates found)
These are evaluated at reconciliation; if uncovered+transferable → enrich the named skill, else delete with reason:
1. `heal/fix-frontmatter.md:165-220` — **non-conforming frontmatter repurposing map** (`id→slug`, `summary→title`, `yields/category→tags`, strip jira/trello/glue, consolidate multiple frontmatter blocks). Not obviously in the blog-post-structure guide. → candidate to enrich `document-co-author/guides/blog-post-structure.md` (generalized "importing/normalizing legacy frontmatter" note).
2. `author/blog-post-structure.md:39-57, 65-88` — the **"I need to…" Purpose format** and the **checkbox Action-Items + implementation-notes** section. → check guide; enrich only if genuinely additive.
3. `refactor/role-refactoring-prompt.md` section-handlers (Knowledge/Definitions/Mindset/Synonyms/Extensions/Backlogs) — diff against `structure-role`; migrate only a handler structure-role truly lacks.

If any of these clear the bar, the file's entry moves from NOT-MIGRATED → MIGRATED (merged/folded) with source→destination links; otherwise it's deleted-because-covered/project-bound and the file is removed.

## Execution

**Phase A — Ledger scaffold.** Create `RECONCILE-LEDGER.md` with all 24 files sectioned and paragraph-group rows + hypothesis verdicts. Create coarse tracker tasks (`Ledger:`/`Reconcile:` per file + cross-cutting).

**Phase B — Reconcile, committed in logical groups.** Work file-by-file (cheap PROJECT-BOUND/STUB files first to shrink the set, then the 3 ⚠️ files):
1. Confirm each paragraph-group's verdict against the named skill.
2. COVERED/PROJECT-BOUND → delete the paragraph; tick the ledger box (name the skill).
3. MIGRATE → enrich the covering skill via `claude-manager:manage-skills` update-skill (generalize paths, additive only); run `evaluate-skill`; move the MIGRATED.md entry; tick the box.
4. File now empty → `git rm`; in NOT-MIGRATED.md replace its entry with "Fully reconciled — every paragraph already covered by `<skills>` (or project-bound); file removed."
5. File has un-classifiable paragraphs → leave file, list them explicitly under a "Human review" section in the ledger (do not guess).
Commit in groups (e.g. "reconcile: heal/* fully covered → removed"); gitleaks hooks must pass.

**Phase C — Marketplace hygiene (only if any skill was enriched).** `evaluate-skill` on each touched skill; bump the plugin `version` + marketplace.json entry; `manage-plugins evaluate-plugin` clean; fix MIGRATED.md destination links to point at the mirror's stable `main` paths (not per-commit SHAs, which the mirror rewrites).

**Phase D — Finish rollout (from the first pass).**
- **Install matrix:** apply `enabledPlugins` per the matrix in `.claude/plans/tender-dreaming-dolphin.md` to each target repo's `.claude/settings.json`. *Outward-facing — confirm before editing other repos.*
- **Branch/merge:** PR/merge the `prompts` reconciliation branch; marketplace → merge to `main`, then `make sync-remote` (protected mirror — never push directly).

## Critical files
- New: `prompts/RECONCILE-LEDGER.md`
- Edit: `prompts/MIGRATED.md`, `prompts/NOT-MIGRATED.md`, the 24 prompt files (delete/remove)
- Possibly edit (only if MIGRATE clears the bar): `…/document-co-author/guides/blog-post-structure.md`, `…/role-manager/skills/structure-role/SKILL.md`, the relevant `plugin.json` + `marketplace.json`
- Read-only reference: the covering SKILL.md files named above

## Verification
- **Coverage:** every paragraph-group in `RECONCILE-LEDGER.md` is ticked with a verdict; no untracked paragraph. MIGRATED.md + NOT-MIGRATED.md reconcile with the ledger.
- **Removal:** `find analyze author brainstorm commands draw heal organize plans refactor research resume-prompts rules solve -name '*.md'` returns only files with an explicit ledger "Human review" entry (ideally none).
- **Skills (if touched):** `evaluate-skill` passes; `grep -rE 'omars-lab|bytesofpurpose|/Users/omareid|workplace/' <touched SKILL.md>` → zero; `manage-plugins evaluate-plugin` clean; versions bumped.
- **Repos:** both working trees clean & committed; gitleaks pre-commit/pre-push green; marketplace published via `make sync-remote`; MIGRATED.md destination links resolve on the mirror `main`.
