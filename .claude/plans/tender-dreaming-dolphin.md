# Migration Plan: Prompts Catalog → oeid Plugin Marketplace

## Context

`/Users/omareid/Workspace/git/prompts` is a flat catalog of ~39 reusable prompts grouped by intent. It overlaps with the sibling `oeid-claude-plugin-marketplace`, which already packages most of this functionality as **plugins** (role-level) containing **skills** (`plugins/<plugin>/skills/<skill>/SKILL.md`). The goal is to retire the loose prompts into the marketplace — but only the content that actually adds value — so there's one discoverable, per-repo-installable home, with hardcoded project paths generalized.

**Decisions locked in:** target = oeid marketplace only · scope = generalize (strip hardcoded paths) · overlaps = audited per-prompt · then execute, highest-value first.

**Critical correction from the user:** do **not** blindly merge based on capability-name overlap. We ran a **content-level audit** — reading each prompt against its proposed target — and the result is that *most* prompts are NOT worth migrating: the existing skills are already as good or better, and many prompts are stubs or single-project artifacts. Blind merging would have polluted good skills. The migration below is intentionally small.

## What the content audit found (the headline)

Of 39 prompts: **~11 carry migration-worthy content**; the rest are **DROP** (redundant to an existing better skill, a one-project artifact, or a 1–3 line stub). The single most valuable cluster — not covered anywhere in the marketplace — is the **self-healing AI-metadata + prompt-metrics** family.

## Migration-WORTHY (the actual work)

### A. New skills — substantial + transferable

| Source prompt(s) | New skill | Plugin | Scope after generalizing |
|---|---|---|---|
| meta/inject-ai-metadata.md **+** meta/update-ai-metadata-posts.md | `manage-ai-metadata` | document-co-author | Inject self-healing AI-readable metadata blocks into docs, then discover & execute those embedded update instructions. The two prompts are a matched inject/execute pair → one skill, two modes. |
| meta/inject-metrics-tracking.md **+** rules/prompt-metrics-emission-rules.md | `inject-prompt-metrics` | claude-manager | Inject a metrics-collection section (JSON-LD schema, analysis formulas) into a prompt/skill. The rules doc is the spec; the meta prompt is the injector → one skill (spec → guides/). |
| meta/meta-content-organizer-creator.md | `meta-content-organizer` | knowledge-manager | Analyze a target directory and generate a custom, self-healing content-organizer prompt for it. Domain-agnostic. |
| analyze/analyze-sql.md | `analyze-sql` | architecture-manager | SQL/query analysis → documentation + PlantUML diagram with validation loop. |
| bootstrap/create-ai-agents-guide.md | `create-ai-agents-guide` | code-quality-manager | Generate an AI-AGENTS.md governance guide (13-section framework) for any repo. |
| heal/fix-broken-docusaurus-links.md | `fix-doc-links` | code-repository-manager | Categorize + repair broken doc links (drafts, slug mismatches, renames, migrations) with prevention patterns. Generalizes beyond Docusaurus. |
| refactor/import-habit.md | `import-structured-doc` | document-co-author *(or knowledge-manager)* | Convert a loose source doc into a structured template (sections, backlinks, hashtag taxonomy). Generalizes beyond "habits". |

### B. Real MERGEs — lift specific content into an existing skill

| Source | Target skill | Exactly what to lift |
|---|---|---|
| author/plantuml-diagram.md | architecture-manager:generate-diagram | The **AWS-icons** block (base URL, `!include` vs `!includeurl`, path corrections, debugging) + the **MDX tabbed embed** pattern (diagram+code tabs, SVG-in-`static/`). Generalize the static path. |
| bootstrap/submodule-makefile-maintenance.md | code-quality-manager:manage-makefiles | The **submodule Makefile targets** (update/status/push), indentation/tab rules, and the workflow/debugging notes. |
| meta/prompt-maturity.md | claude-manager:manage-skills (evaluate-skill) | The **maturity dimensions** — self-healing, metrics-instrumentation, feedback-loop — as new scoring dimensions + the Experimental→Production maturity levels. |

### C. FOLD — content survives only as a step/sub-section inside one of the above (not its own skill)

- author/author-prompt-post.md → folds into `manage-ai-metadata` / document-co-author authoring guides (blog-structure + metrics-table patterns), paths stripped.
- heal/fix-category-files.md + heal/fix-figma-link.md → fold into `fix-doc-links` (sidebar/category repair + figma-embed conversion as sub-steps).
- organize/tag-tasks.md + commands/noteplan/generate-weekly-summary.md → fold the *generic* tagging/summary step into noteplan-manager:sweep-daily-notes guides (the taxonomies themselves are project-specific → not migrated).
- research/research-genai-arch-patterns.md → the research-synthesis *checklist* (not the URLs) folds into the existing `deep-research` flow as a template; the GenAI content stays as a one-off note.

## DROP — do NOT migrate (with reason)

| Prompt | Why dropped |
|---|---|
| analyze/review-code.md | Just a transcript of one review; poke-holes is a far more complete method. |
| analyze/deep-dive-into-code.md | Stub — bare internal link. |
| heal/fix-frontmatter.md, heal/fix-readme-primary.md, heal/fix-readmes.md | Target update-docs is about co-design publishing — orthogonal; content is one-project README/frontmatter chores. |
| refactor/role-refactoring-prompt.md | role-manager:structure-role (1700+ lines) already supersedes it. |
| brainstorm/ask-me.md | experiment-manager:asking-what-if already realizes the same questioning method. |
| heal/heal-noteplan-file-names.md, heal/fix-emojis-used.md | noteplan-manager:manage-filenames / manage-emojis already cover these. |
| organize/carry-over-daily-todos.md | Superseded by noteplan-manager:sweep-daily-notes. |
| resume-prompts/check-resume.prompt.md, point-extraction.prompt.md | 1–2 line stubs; profile-manager:refactor-resume-bullets is complete. |
| author/blog-post-structure.md | Micro-rule; document-co-author is deck-focused, doesn't apply. |
| rules/task-handling-rules.md | sweep-daily-notes already encodes task-hierarchy preservation. |
| draw/customize-kanban-board.md | All value is hardcoded SVG coordinates for one file — nothing transferable. |
| organize/organize-personal-todos.md, organize/organize-work-tasks.md | Substantial but inseparable from the user's personal/Amazon folder + workstream structure. |
| heal/fix-portfolio.md | Single React project. |
| plans/broken-links-resolution-plan.md, plans/seo-improvement-plan.md | One-off outputs, not prompts. |
| solve/solve-leetcode-and-teach.md | 2-line stub. |

**Net migration:** 7 new skills · 3 real merges · 2 folds · ~23 drops. (Down from a naive "migrate everything" of 39.)

**Execution reclassifications (Phase 4):** Two planned folds were dropped on closer inspection, honoring "don't fold thin/redundant content":
- `organize/tag-tasks.md` → DROP. `noteplan-manager:sweep-daily-notes` already maps daily-note sections to plan initiatives under `# [[PlanName]]` headers — the linking capability exists and is better; tag-tasks' only extra is a project-specific Amazon hashtag taxonomy (not migratable).
- `research/research-genai-arch-patterns.md` → DROP. The generic "research synthesis" capability is already what the `deep-research` harness skill does; the GenAI URLs are a one-off note.
- `commands/noteplan/generate-weekly-summary.md` stays DROP (thin stub) as planned.
- `author/author-prompt-post.md` folded into `document-co-author/guides/blog-post-structure.md` (done). `heal/fix-category-files.md` + `heal/fix-figma-link.md` folded into the new `fix-doc-links` skill (done in Phase 2).

## Install matrix — which plugins on which repos

| Repo / context | Plugins to install |
|---|---|
| omars-lab.github.io (blog/Docusaurus) | document-co-author, code-repository-manager, architecture-manager, code-quality-manager, knowledge-manager |
| NotePlan vaults | noteplan-manager, knowledge-manager |
| Work repos (`workplace/…`) | code-quality-manager, architecture-manager, code-repository-manager, servicenow-manager |
| Any code repo (general dev) | code-quality-manager, code-repository-manager, claude-manager |
| Resume / personal brand | profile-manager |
| This prompts repo | retired → archive/redirect |

Applied per-repo via `.claude/settings.json` `enabledPlugins`.

## Execution phases

**Phase 0 — Branch.** Feature branch in the marketplace repo. Prompts repo stays intact until Phase 5.

**Phase 1 — High-value new cluster (do first).** The AI-metadata + metrics family is the unique, non-redundant value:
1. `claude-manager:inject-prompt-metrics` (fold rules/prompt-metrics-emission-rules.md spec → guides).
2. `document-co-author:manage-ai-metadata` (inject + execute modes).
Scaffold via `claude-manager:manage-skills` create-skill; generalize all paths; `evaluate-skill` each.

**Phase 2 — Remaining new skills.** `meta-content-organizer`, `analyze-sql`, `create-ai-agents-guide`, `fix-doc-links` (absorbing fix-category-files + fix-figma-link), `import-structured-doc`. Same scaffold → generalize → evaluate loop.

**Phase 3 — Real merges (B).** For each, read the target SKILL.md, lift only the named content, generalize paths, integrate via `manage-skills` update-skill, then evaluate-skill. Keep edits additive.

**Phase 4 — Folds (C).** Add the surviving steps/guides into the named host skills. No new skills.

**Phase 5 — Manifest + docs.** Bump `version` in each touched `plugin.json` + the marketplace.json entry; update plugin READMEs' skill lists; validate with `claude-manager:manage-plugins` (fix-plugins / evaluate-plugin).

**Phase 6 — Retire prompts repo.** Replace files with `MIGRATED.md` (old path → new `plugin:skill`, or → DROP w/ reason). Update README to point at the marketplace. Commit separately.

**Phase 7 — Install matrix rollout.** Apply the per-repo plugin sets above.

## Generalization rules (every migrated item)

- Replace absolute paths (`/Users/omareid/…`, `omars-lab.github.io`, `bytesofpurpose-blog`, NotePlan abs paths) with: run against the invoking repo, or a documented skill argument the skill discovers/asks for.
- Replace hardcoded usernames/workstreams (SDS/QC/Weblab/GenAI) with config the skill reads or prompts for.
- Drop boilerplate already covered by the host skill; keep only the unique logic named in the tables above.
- Every new/merged skill must pass `evaluate-skill` before its plugin version bumps.

## Verification

- **No leftover hardcoding:** `grep -rE 'omars-lab|bytesofpurpose|/Users/omareid|workplace/' ` over each touched SKILL.md → expect zero.
- **Structural:** `manage-plugins` evaluate-plugin over each touched plugin → no schema errors; marketplace.json lists all plugins with bumped versions.
- **Skill-level:** `evaluate-skill` on every new/merged skill → frontmatter valid, discoverable description.
- **Functional spot-checks (plugin installed in a real repo):** invoke `manage-ai-metadata` on a doc → metadata injected + a later run executes the embedded update; `inject-prompt-metrics` on a skill → metrics section added; `fix-doc-links` on a docs repo → fixes that repo, not a hardcoded one; `analyze-sql` on a query → diagram + doc produced.
- **Coverage:** every prompt is either committed in the marketplace or listed in `MIGRATED.md` (incl. drops). No prompt silently lost.

## Open risks / notes

- **DROP set is large by design** — confirm you're comfortable retiring ~21 prompts as redundant/one-off before Phase 6 deletes them. Nothing is deleted until then; `MIGRATED.md` preserves the audit trail.
- `import-structured-doc` plugin home (document-co-author vs knowledge-manager) is a judgment call — pick at Phase 2.
- The AI-metadata/metrics cluster is the keystone; if it proves bigger than expected, split inject vs execute into sub-skills rather than inflating one SKILL.md.
