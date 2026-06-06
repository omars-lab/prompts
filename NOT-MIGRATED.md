# What Wasn't Migrated — and Why

Companion to [MIGRATED.md](MIGRATED.md). This is the justification log for every prompt that was **not** carried into the [oeid-claude-plugin-marketplace](https://github.com/omars-lab/claude-plugin-marketplace).

## The bar

Migration was not "move everything." Each prompt was **content-audited** — read against the existing skill catalog — and kept only if it cleared one bar:

> Would a future me, working in a *different* repo, invoke this and get value the marketplace doesn't already give?

A prompt failed that bar — and was dropped — for one of four reasons:

| Reason | Meaning |
|---|---|
| **REDUNDANT** | An existing skill already does this, as well or better. Migrating it would duplicate or *dilute* a good skill. |
| **PROJECT-BOUND** | Real, substantial content, but inseparable from one specific project's paths/structure/taxonomy. Nothing transferable survives generalization. |
| **STUB** | A 1–3 line placeholder with no actual logic to migrate. |
| **ONE-OFF OUTPUT** | An artifact a prompt *produced* (a plan, a report), not a reusable prompt itself. |

Of 39 prompts: **11 migrated**, **4 merged/folded**, **24 dropped**. The large drop count is the point — the marketplace already covered most of this catalog, and the audit (after a course-correction) treated "an existing skill is better" as a reason to drop, not to merge. Nothing is lost: every dropped file is preserved in git and linked from MIGRATED.md.

> **Reconciliation pass (finer, paragraph-level).** The 24 drops below were originally judged **at the file level**. A second pass then walked each dropped file **paragraph-by-paragraph** against the covering skills, recording a verdict for every paragraph in **[RECONCILE-LEDGER.md](RECONCILE-LEDGER.md)** (covered / project-bound / migrated). Outcome: **every paragraph was already covered or project-bound, except one** — the non-conforming-frontmatter map in `heal/fix-frontmatter.md` (lines 165-220), which was folded into `document-co-author:import-structured-doc` (now listed in MIGRATED.md's Merged/folded table). All 24 files have been **removed from this repo**; git history + the ledger preserve the full trail. The per-reason notes below still explain *why* each file was dropped.

---

## REDUNDANT — an existing skill already does it (better)

These were the tempting ones — they *look* migratable because a same-named capability exists. But reading the prompt against the target skill showed the skill already supersedes it. Folding the prompt in would have polluted a mature skill with weaker, often project-specific instructions.

- **`analyze/review-code.md`** — Not actually a reusable prompt; it's a *transcript* of one code-review session (a specific Java refactor). `code-quality-manager:poke-holes` is a real method (10-category assumption surfacing, stress-testing, persistent assumptions log). The transcript adds nothing the method lacks.

- **`refactor/role-refactoring-prompt.md`** — A procedural sequence for one repo's `personalbook` layout. `role-manager:structure-role` (1700+ lines) already encodes the deeper framework: maturity levels, role categories, cross-role awareness, content-preservation protocol, migration checklist. The prompt is a subset.

- **`brainstorm/ask-me.md`** — The "ask guiding questions to move from fuzzy to concrete" method is exactly what `experiment-manager:asking-what-if` already realizes, more completely.

- **`heal/heal-noteplan-file-names.md`** — `noteplan-manager:manage-filenames` already covers filename↔header normalization with emoji handling.

- **`heal/fix-emojis-used.md`** — `noteplan-manager:manage-emojis` already owns emoji standardization.

- **`organize/carry-over-daily-todos.md`** — Superseded by `noteplan-manager:sweep-daily-notes`, which carries incomplete tasks forward with hierarchy preservation as part of a broader, safer sweep.

- **`organize/tag-tasks.md`** — `sweep-daily-notes` already maps daily-note sections to plan initiatives under `# [[PlanName]]` wikilink headers — that *is* the link-tasks-to-plans capability, done better. The prompt's only extra was a hardcoded Amazon hashtag taxonomy (see PROJECT-BOUND).

- **`rules/task-handling-rules.md`** — The task-hierarchy preservation rules (treat chunks as units, respect indentation, never split parent/child) are already encoded operationally inside `sweep-daily-notes`. A standalone rules doc would just restate them.

- **`heal/fix-frontmatter.md`, `heal/fix-readme-primary.md`, `heal/fix-readmes.md`** — One-project frontmatter/README chores. The nearest skill (`code-repository-manager:update-docs`) is about *publishing* co-design docs to wiki/Pages — orthogonal. There was no transferable method here, only repo-specific cleanup steps.

- **`resume-prompts/check-resume.prompt.md`, `resume-prompts/point-extraction.prompt.md`** — One- and two-line stubs ("review my resume", "extract points from my promo doc"). `profile-manager:refactor-resume-bullets` is a complete, research-backed workflow. (Also STUBs — listed here because the redundancy is the stronger reason.)

- **`author/blog-post-structure.md`** — A micro-rule about blog frontmatter/sections. Its substance is now the generalized `document-co-author/guides/blog-post-structure.md` (see MIGRATED.md), which supersedes it.

- **`research/research-genai-arch-patterns.md`** — The generic "research → synthesize → document" capability is already what the `deep-research` harness does. What remained was a one-off list of GenAI URLs and notes — not a reusable prompt.

---

## PROJECT-BOUND — real content, but welded to one project

Substantial prompts whose value *is* the hardcoded specifics. Strip the paths/taxonomy/coordinates to generalize, and nothing load-bearing is left.

- **`organize/organize-personal-todos.md`** — A genuinely rich organizer, but mapped to one person's NotePlan personal-life folder structure and templates. The logic is the folder map.

- **`organize/organize-work-tasks.md`** — Same, for Amazon work content: routes by specific workstreams (SDS, QC, Weblab, GenAI, …) into a specific directory tree. Inseparable from that context.

- **`draw/customize-kanban-board.md`** — All value lives in hardcoded SVG x/y coordinates and a color palette for one specific `kanban-structure.svg`. Generalizing strips exactly the content that makes it work.

- **`heal/fix-portfolio.md`** — Troubleshooting steps for one specific React portfolio project. Not a reusable method.

---

## STUB — too thin to migrate

Placeholders with no real instructions to carry.

- **`analyze/deep-dive-into-code.md`** — Essentially a bare link to an internal code repo. No prompt body.

- **`commands/noteplan/generate-weekly-summary.md`** — ~3 lines requesting a weekly NotePlan summary. The aggregation idea is reusable in principle, but there's no logic here to migrate, and `sweep-daily-notes` covers the adjacent need.

- **`solve/solve-leetcode-and-teach.md`** — Two lines ("solve leetcode and teach; make a blog post"). Concept only, no implementation.

---

## ONE-OFF OUTPUT — artifacts, not prompts

These are things a prompt *produced* for one project, checked into the catalog by accident of organization. They're records, not reusable tools.

- **`plans/broken-links-resolution-plan.md`** — A specific remediation plan for one site's link rot, with progress tracking. An output of doing the work, not a prompt to reuse.

- **`plans/seo-improvement-plan.md`** — A specific SEO strategy for one blog/domain. Same: a deliverable, not a reusable prompt.

---

## If you disagree with a drop

Every dropped file still exists at [`omars-lab/prompts@59e9b39`](https://github.com/omars-lab/prompts/tree/59e9b39) (linked per-file in MIGRATED.md). To rescue one:

1. **REDUNDANT** → if you think the prompt has a nuance the existing skill lacks, the move is to *enrich that skill* (via `claude-manager:manage-skills` update-skill), not to recreate the prompt.
2. **PROJECT-BOUND** → if the project context is stable and worth automating, it belongs as a **project-level skill** in that repo's own `.claude/skills/`, not in the shared marketplace.
3. **STUB** → flesh it out into a real prompt first; then re-audit.
4. **ONE-OFF OUTPUT** → keep as a doc/note where the work lives; it isn't prompt material.
