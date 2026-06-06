# Reconciliation Ledger — Paragraph-Level Audit of the 24 Not-Migrated Prompts

Companion to [MIGRATED.md](MIGRATED.md) and [NOT-MIGRATED.md](NOT-MIGRATED.md). The first migration pass dropped 24 prompts **at the file level**. This ledger records the finer, **paragraph-by-paragraph** pass: every paragraph-group of every dropped file gets one of three verdicts, so nothing is silently lost.

**Verdicts**
- **COVERED** — an existing `plugin:skill` conveys this instruction as well or better → paragraph deleted (skill named).
- **PROJECT-BOUND** — hardcoded path/taxonomy/coordinates, no transferable instruction → paragraph deleted, reason noted.
- **MIGRATE** — uncovered + transferable → covering skill enriched, then file entry moved to MIGRATED.md.

A *paragraph-group* = a contiguous run of paragraphs (heading+body, a list, or a fenced block) sharing one verdict. Line numbers are from the files as they stood at the start of this pass. A ticked box `[x]` means that group has been reconciled (deleted/migrated) and the verdict confirmed against the named skill.

Plan: [`.claude/plans/linked-sleeping-hanrahan.md`](.claude/plans/linked-sleeping-hanrahan.md).

---

## analyze/review-code.md
- [x] analyze/review-code.md:1-207 — COVERED `code-quality-manager:poke-holes` — entire file is a raw chat transcript of one Java review (hardcoded `workplace/CR-215120005` paths); no reusable instruction. (also PROJECT-BOUND)

## analyze/deep-dive-into-code.md
- [x] analyze/deep-dive-into-code.md:1-2 — PROJECT-BOUND — title + a bare `code.amazon.com` search URL. STUB.

## author/blog-post-structure.md
- [x] author/blog-post-structure.md:1-31 — COVERED `document-co-author/guides/blog-post-structure.md` — frontmatter block + requirements (slug/title/description/authors/tags/date/draft). Guide covers frontmatter; `authors: [oeid]` is PROJECT-BOUND.
- [x] author/blog-post-structure.md:32-38 — COVERED `document-co-author/guides/blog-post-structure.md` — title+description section skeleton.
- [x] author/blog-post-structure.md:39-57 — COVERED `document-co-author/guides/blog-post-structure.md` §1 (High-level overview: intent/problem, value prop, audience) — same purpose as the "I need to…" Purpose section, generalized; the "I need to…" phrasing is a project stylistic preference, not a superior instruction. (resolved: not a migrate)
- [x] author/blog-post-structure.md:58-64 — COVERED `document-co-author/guides/blog-post-structure.md` — main-content guidelines (visual indicators, tables, code blocks).
- [x] author/blog-post-structure.md:65-89 — COVERED `document-co-author/guides/blog-post-structure.md` (Readability rules: "end with clear takeaways/CTA") — serves the same reader-activation purpose; adding a weaker checkbox-list pattern would dilute the mature guide. (resolved: not a migrate)
- [x] author/blog-post-structure.md:90-134 — COVERED `document-co-author:manage-ai-metadata` — AI-metadata collapsible block (the inject/execute pair is that skill).
- [x] author/blog-post-structure.md:135-258 — COVERED `document-co-author/guides/blog-post-structure.md` — writing style, formatting, examples, quality checklist, integration notes, maintenance, good/bad examples, success criteria (restates the guide; project links PROJECT-BOUND).

## brainstorm/ask-me.md
- [x] brainstorm/ask-me.md:1-10 — COVERED `experiment-manager:asking-what-if` — the guided-question "fuzzy → concrete" mentor method, realized more completely there.

## commands/noteplan/generate-weekly-summary.md
- [x] commands/noteplan/generate-weekly-summary.md:1-7 — COVERED `noteplan-manager:sweep-daily-notes` — intent + task parent/child indentation model (sweep encodes hierarchy preservation). Calendar path PROJECT-BOUND.
- [x] commands/noteplan/generate-weekly-summary.md:8-28 — COVERED `noteplan-manager:sweep-daily-notes` — weekly report structure (per-initiative sections, work/personal split, completed-vs-outstanding, hierarchy, date tags) + constraints. STUB beyond what sweep covers; output path PROJECT-BOUND.

## draw/customize-kanban-board.md
- [x] draw/customize-kanban-board.md:1-216 — PROJECT-BOUND — entire file is hardcoded SVG x/y coordinates, color palette, and card positions for one `static/img/kanban-structure.svg`. Generalizing strips exactly the load-bearing content.

## heal/fix-emojis-used.md
- [x] heal/fix-emojis-used.md:1 — PROJECT-BOUND — one-line chore against one blog file (`bytesofpurpose-blog/docs/9-definitions/emojis.md`) + a NotePlan personal folder path. Adjacent skill: `noteplan-manager:manage-emojis`.

## heal/fix-frontmatter.md
- [x] heal/fix-frontmatter.md:1-79 — PROJECT-BOUND — overview + bash detection commands hardcoded to `omars-lab.github.io` / `bytesofpurpose-blog` directory tree.
- [x] heal/fix-frontmatter.md:80-164 — COVERED `document-co-author/guides/blog-post-structure.md` — blog/docs frontmatter attribute rules + draft conventions + per-type patterns (guide covers frontmatter authoring).
- [x] ⚠️ heal/fix-frontmatter.md:165-220 — **MIGRATED** → `document-co-author:import-structured-doc` `guides/section-template.md` §1 "Salvaging legacy / non-conforming frontmatter" (new generalized field-mapping table + consolidation/drop rules). The only migrate that cleared the bar.
- [x] heal/fix-frontmatter.md:221-396 — PROJECT-BOUND — processing approach, success criteria, "47 files fixed" experience log — all repo-specific chore/run records.

## heal/fix-portfolio.md
- [x] heal/fix-portfolio.md:1-531 — PROJECT-BOUND — troubleshooting log for one React portfolio (its CSS classes, components, ports). Not a reusable method.

## heal/fix-readme-primary.md
- [x] heal/fix-readme-primary.md:1-336 — PROJECT-BOUND — README-maintenance steps hardcoded to `omars-lab.github.io` structure, build commands, and links.

## heal/fix-readmes.md
- [x] heal/fix-readmes.md:1 — PROJECT-BOUND — one-line rule about `bytesofpurpose-blog/docs` README indexing.

## heal/heal-noteplan-file-names.md
- [x] heal/heal-noteplan-file-names.md:1-48 — COVERED `noteplan-manager:manage-filenames` → `fix-filenames` — golden rule (filename = H1), convention discovery, batch renames, safety. fix-filenames codifies the conventions table + issue classification + git-mv safety (better than the self-healing-by-discovery prompt).

## organize/carry-over-daily-todos.md
- [x] organize/carry-over-daily-todos.md:1-7,21-78 — COVERED `noteplan-manager:sweep-daily-notes` — carry-over intent, task-structure preservation, completion handling, date-tag management, output organization (sweep does verbatim hierarchy-preserving day-by-day moves).
- [x] organize/carry-over-daily-todos.md:8-20 — PROJECT-BOUND — meeting-notes extraction to `🏢 Amazon/…` workstream dirs with hardcoded templates/paths.
- [x] organize/carry-over-daily-todos.md:79-231 — COVERED `noteplan-manager:sweep-daily-notes` — input dir, processing order, day-by-day workflow, business-day/Saturday routing, validation (all in sweep). Username/path + emoji taxonomy (146-191, 232-248) PROJECT-BOUND.
- [x] organize/carry-over-daily-todos.md:232-668 — COVERED `noteplan-manager:sweep-daily-notes` — validation reports, confirmation, theme merging, error/rollback, output format, worked example, key-points recap (sweep covers operationally). Emoji categories + machine paths PROJECT-BOUND.

## organize/tag-tasks.md
- [x] organize/tag-tasks.md:1-9 — COVERED `noteplan-manager:sweep-daily-notes` — intent (link daily tasks to plan initiatives) + input paths; sweep maps sections to plans under `# [[PlanName]]` headers. Paths PROJECT-BOUND.
- [x] organize/tag-tasks.md:10-28 — PROJECT-BOUND — hardcoded Amazon hashtag→workstream taxonomy (#sds/#qc/#weblab/…).
- [x] organize/tag-tasks.md:29-60 — COVERED `noteplan-manager:sweep-daily-notes` — output format / coverage summary (sweep's mapping output supersedes).

## organize/organize-personal-todos.md
- [x] organize/organize-personal-todos.md:1-16 — COVERED `knowledge-manager:meta-content-organizer` — "intelligent content organizer with a directory index" pattern + task-handling rules (sweep-daily-notes).
- [x] organize/organize-personal-todos.md:17-161 — PROJECT-BOUND — the entire personal NotePlan folder index (Habits/Questions/Goals/Plans/Lists/… with file lists). The index *is* the content.
- [x] organize/organize-personal-todos.md:162-305 — COVERED `knowledge-manager:meta-content-organizer` — routing-by-content-type, self-healing detection, output dashboard, self-update protocol (meta-content-organizer generates exactly this kind of self-healing organizer). Life-area mappings PROJECT-BOUND.

## organize/organize-work-tasks.md
- [x] organize/organize-work-tasks.md:1-22 — COVERED `knowledge-manager:meta-content-organizer` — organizer intent + NotePlan template processing rules. Paths PROJECT-BOUND.
- [x] organize/organize-work-tasks.md:23-121 — PROJECT-BOUND — the Amazon work folder index (Lists/Plans/Meetings/Backlogs/… with workstream file lists).
- [x] organize/organize-work-tasks.md:122-212 — COVERED `knowledge-manager:meta-content-organizer` — smart routing, workstream mapping, analysis tasks, output dashboard, self-healing execution. Workstream specifics PROJECT-BOUND.

## plans/broken-links-resolution-plan.md
- [x] plans/broken-links-resolution-plan.md:1-38 — COVERED `code-repository-manager:fix-doc-links` (+ guides/link-taxonomy.md) — problem statement + systematic analysis approach.
- [x] plans/broken-links-resolution-plan.md:39-96 — COVERED `fix-doc-links/guides/link-taxonomy.md` — root-cause categories (draft-excluded, slug mismatch, missing path segment, dir-vs-file) = taxonomy categories 1-4; remaining-mystery edge cases = category 8.
- [x] plans/broken-links-resolution-plan.md:97-145 — COVERED `fix-doc-links` SKILL "Verify" + taxonomy cat 8 — investigation/cache-clear/route-manifest/alt-format action plan.
- [x] plans/broken-links-resolution-plan.md:146-190 — COVERED `fix-doc-links/guides/link-taxonomy.md` Part 4 (Prevention) — lessons learned/best practices/next steps. Site-specific results PROJECT-BOUND/ONE-OFF.

## plans/seo-improvement-plan.md
- [x] plans/seo-improvement-plan.md:1-619 — PROJECT-BOUND / ONE-OFF — a specific SEO strategy + 16-week script roadmap for one blog/domain (blog.bytesofpurpose.com, GA id, named drafts). A deliverable, not a reusable prompt.

## refactor/role-refactoring-prompt.md
- [x] refactor/role-refactoring-prompt.md:1-46 — COVERED `role-manager:structure-role` — intent + file-discovery/validation/error-handling/QA preamble (structure-role's content-preservation + migration checklist supersede; `personalbook` path PROJECT-BOUND).
- [x] refactor/role-refactoring-prompt.md:47-129 — COVERED `role-manager:structure-role` — Activities.md creation + individual activity-file rules (move planning vs keep personal).
- [x] refactor/role-refactoring-prompt.md:130-461 — COVERED `role-manager:structure-role` — diffed all handlers: Responsibilities Inputs/Outputs/Metrics (SKILL.md:1119,1206,1573), Role Extensions ("Skill Extension (extends)" :117-148), Synonyms ("Role Evolution / Previous Names" :1409-1443), Backlogs/Unorganized (:474,1082,1355-1357,1641), Knowledge/Definitions/Mindset/Overview/Philosophy/Overlap all present. No handler is uncovered. (resolved: not a migrate)
- [x] refactor/role-refactoring-prompt.md:462-543 — COVERED `role-manager:structure-role` — key principles, example usage, final validation checklist, expected outcome (structure-role's framework supersedes).

## research/research-genai-arch-patterns.md
- [x] research/research-genai-arch-patterns.md:1-44 — COVERED `deep-research` — the research→synthesize→document task + incremental research instructions. The URL list is a one-off note (PROJECT-BOUND).
- [x] research/research-genai-arch-patterns.md:45-84 — PROJECT-BOUND — captured findings/patterns + doc location for one blog page. ONE-OFF OUTPUT.

## resume-prompts/check-resume.prompt.md
- [x] resume-prompts/check-resume.prompt.md:1-4 — COVERED `profile-manager:refactor-resume-bullets` — "expert resume reviewer, review knowledge/resume-to-check.md" is a 1-line stub of that complete workflow.

## resume-prompts/point-extraction.prompt.md
- [x] resume-prompts/point-extraction.prompt.md:1-5 — COVERED `profile-manager:refactor-resume-bullets` — "extract key phrases from promo-doc.md for resume" is a stub of that workflow.

## rules/task-handling-rules.md
- [x] rules/task-handling-rules.md:1-35 — COVERED `noteplan-manager:sweep-daily-notes` — task-chunk-as-unit, indentation immutable, no parent-child split, allowed/forbidden modifications (sweep encodes these as operational "no content modification" + "indentation is immutable" rules).

## solve/solve-leetcode-and-teach.md
- [x] solve/solve-leetcode-and-teach.md:1-2 — STUB — 2-line concept ("solve leetcode + teach + blog post"); no logic to migrate.

---

## Human review (un-classifiable paragraphs)

Reconciliation merged with upstream `origin/main` (commits `cabff35..dd51eaf`), which **added/changed prompts after the original audit**. These are out of the original 24-file scope and need their own reconciliation pass — they were **kept** (not deleted), pending review:

- `heal/fix-readmes.md` — I had deleted the 1-line stub (PROJECT-BOUND); upstream `ed3db9e` replaced it with a substantial 209-line **folder-README-as-navigation-index** authoring method (frontmatter + intent + distinction-from-siblings + "What You'll Find Here" + recursive child-README linking + quality checklist). Conflict resolved by **keeping the upstream version**. NOT clearly covered: `manage-docs/improve-docs` audits/consolidates docs but doesn't prescribe this README-index pattern; `fix-doc-links` covers `_category_.json` sidebar files, not prose index READMEs. → candidate to migrate into `code-quality-manager:manage-docs` (or a new `author-readme-index` sub-skill); examples are Docusaurus-specific and need generalizing.
- `author/data-structure-mental-model-guide.md` — new upstream prompt, unreviewed.
- `bootstrap/blog-posts.md` — new upstream prompt, unreviewed.
- `heal/heal-blog-changelog.md` — new upstream prompt, unreviewed.

Note: upstream `dd51eaf` independently deleted `refactor/role-refactoring-prompt.md` ("moved to a skill") — agrees with this pass's deletion.
