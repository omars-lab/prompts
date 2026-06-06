# Migration Map — Prompts Catalog → oeid Plugin Marketplace

This catalog has been migrated into the **oeid-claude-plugin-marketplace** as plugins/skills. Each prompt was **content-audited** — read against the existing skill catalog — and migrated only if it added value. Most prompts were dropped as redundant (an existing skill already does it better), one-off project artifacts, or stubs.

Full plan + audit: [`.claude/plans/tender-dreaming-dolphin.md`](.claude/plans/tender-dreaming-dolphin.md).

**Link conventions**
- **Source** links point at the last commit where the file existed in this repo: [`omars-lab/prompts@59e9b39`](https://github.com/omars-lab/prompts/tree/59e9b39).
- **Destination** links point at the marketplace mirror's stable `main` branch: [`omars-lab/claude-plugin-marketplace@main`](https://github.com/omars-lab/claude-plugin-marketplace/tree/main). (The mirror author-rewrites commit SHAs on each `make sync-remote`, so per-commit permalinks drift; `main`-branch paths stay stable.)

A second, finer reconciliation pass walked every **dropped** file paragraph-by-paragraph against the existing skills. Its per-paragraph audit trail (each paragraph → covered / project-bound / migrated) lives in **[RECONCILE-LEDGER.md](RECONCILE-LEDGER.md)**; all dropped files have since been removed from this repo (git history preserves them).

---

## Migrated to a new skill

| Source prompt | → Destination skill |
|---|---|
| [inject-ai-metadata.md](https://github.com/omars-lab/prompts/blob/59e9b39/meta/inject-ai-metadata.md) + [update-ai-metadata-posts.md](https://github.com/omars-lab/prompts/blob/59e9b39/meta/update-ai-metadata-posts.md) | [`document-co-author:manage-ai-metadata`](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/document-co-author/skills/manage-ai-metadata/SKILL.md) |
| [inject-metrics-tracking.md](https://github.com/omars-lab/prompts/blob/59e9b39/meta/inject-metrics-tracking.md) + [prompt-metrics-emission-rules.md](https://github.com/omars-lab/prompts/blob/59e9b39/rules/prompt-metrics-emission-rules.md) | [`claude-manager:inject-prompt-metrics`](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/claude-manager/skills/inject-prompt-metrics/SKILL.md) |
| [meta-content-organizer-creator.md](https://github.com/omars-lab/prompts/blob/59e9b39/meta/meta-content-organizer-creator.md) | [`knowledge-manager:meta-content-organizer`](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/knowledge-manager/skills/meta-content-organizer/SKILL.md) |
| [analyze-sql.md](https://github.com/omars-lab/prompts/blob/59e9b39/analyze/analyze-sql.md) | [`architecture-manager:analyze-sql`](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/architecture-manager/skills/analyze-sql/SKILL.md) |
| [create-ai-agents-guide.md](https://github.com/omars-lab/prompts/blob/59e9b39/bootstrap/create-ai-agents-guide.md) | [`code-quality-manager:create-ai-agents-guide`](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/code-quality-manager/skills/create-ai-agents-guide/SKILL.md) |
| [fix-broken-docusaurus-links.md](https://github.com/omars-lab/prompts/blob/59e9b39/heal/fix-broken-docusaurus-links.md) + [fix-category-files.md](https://github.com/omars-lab/prompts/blob/59e9b39/heal/fix-category-files.md) + [fix-figma-link.md](https://github.com/omars-lab/prompts/blob/59e9b39/heal/fix-figma-link.md) | [`code-repository-manager:fix-doc-links`](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/code-repository-manager/skills/fix-doc-links/SKILL.md) |
| [import-habit.md](https://github.com/omars-lab/prompts/blob/59e9b39/refactor/import-habit.md) | [`document-co-author:import-structured-doc`](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/document-co-author/skills/import-structured-doc/SKILL.md) |

## Merged / folded into an existing skill or guide

| Source prompt | → Folded into |
|---|---|
| [plantuml-diagram.md](https://github.com/omars-lab/prompts/blob/59e9b39/author/plantuml-diagram.md) | [`architecture-manager:generate-diagram`](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/architecture-manager/skills/generate-diagram/SKILL.md) — AWS-icons + MDX-embed sections |
| [submodule-makefile-maintenance.md](https://github.com/omars-lab/prompts/blob/59e9b39/bootstrap/submodule-makefile-maintenance.md) | [`manage-makefiles` guides/git-submodules.md](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/code-quality-manager/skills/manage-makefiles/guides/git-submodules.md) |
| [prompt-maturity.md](https://github.com/omars-lab/prompts/blob/59e9b39/meta/prompt-maturity.md) | [`evaluate-skill` guides/maturity-dimensions.md](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/claude-manager/skills/manage-skills/evaluate-skill/guides/maturity-dimensions.md) |
| [author-prompt-post.md](https://github.com/omars-lab/prompts/blob/59e9b39/author/author-prompt-post.md) | [`document-co-author` guides/blog-post-structure.md](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/document-co-author/guides/blog-post-structure.md) |
| [heal/fix-frontmatter.md](https://github.com/omars-lab/prompts/blob/59e9b39/heal/fix-frontmatter.md) (lines 165-220 only — the non-conforming frontmatter map) | [`import-structured-doc` guides/section-template.md](https://github.com/omars-lab/claude-plugin-marketplace/blob/main/plugins/document-co-author/skills/import-structured-doc/guides/section-template.md) — "Salvaging legacy / non-conforming frontmatter" (reconciliation pass; rest of the file was project-bound chores) |

## Dropped — not migrated (with reason)

> For the full reasoning behind each drop — grouped by *why* (redundant / project-bound / stub / one-off) and what to do if you disagree — see **[NOT-MIGRATED.md](NOT-MIGRATED.md)**. The table below is the quick index.

View any dropped file at [`omars-lab/prompts@59e9b39`](https://github.com/omars-lab/prompts/tree/59e9b39).

| Prompt | Why dropped |
|---|---|
| [analyze/review-code.md](https://github.com/omars-lab/prompts/blob/59e9b39/analyze/review-code.md) | A single review transcript; `code-quality-manager:poke-holes` is a complete method. |
| [analyze/deep-dive-into-code.md](https://github.com/omars-lab/prompts/blob/59e9b39/analyze/deep-dive-into-code.md) | Stub — bare internal link. |
| [heal/fix-frontmatter.md](https://github.com/omars-lab/prompts/blob/59e9b39/heal/fix-frontmatter.md) | Mostly one-project frontmatter chore; the one transferable paragraph (non-conforming frontmatter map) was folded into `import-structured-doc` — see the Merged/folded table. |
| [heal/fix-readme-primary.md](https://github.com/omars-lab/prompts/blob/59e9b39/heal/fix-readme-primary.md), [heal/fix-readmes.md](https://github.com/omars-lab/prompts/blob/59e9b39/heal/fix-readmes.md) | One-project README chores. |
| [refactor/role-refactoring-prompt.md](https://github.com/omars-lab/prompts/blob/59e9b39/refactor/role-refactoring-prompt.md) | `role-manager:structure-role` supersedes it. |
| [brainstorm/ask-me.md](https://github.com/omars-lab/prompts/blob/59e9b39/brainstorm/ask-me.md) | `experiment-manager:asking-what-if` already realizes the method. |
| [heal/heal-noteplan-file-names.md](https://github.com/omars-lab/prompts/blob/59e9b39/heal/heal-noteplan-file-names.md) | `noteplan-manager:manage-filenames` covers it. |
| [heal/fix-emojis-used.md](https://github.com/omars-lab/prompts/blob/59e9b39/heal/fix-emojis-used.md) | `noteplan-manager:manage-emojis` covers it. |
| [organize/carry-over-daily-todos.md](https://github.com/omars-lab/prompts/blob/59e9b39/organize/carry-over-daily-todos.md) | Superseded by `noteplan-manager:sweep-daily-notes`. |
| [organize/tag-tasks.md](https://github.com/omars-lab/prompts/blob/59e9b39/organize/tag-tasks.md) | `sweep-daily-notes` already maps tasks to plan initiatives; the rest is a project-specific hashtag taxonomy. |
| [organize/organize-personal-todos.md](https://github.com/omars-lab/prompts/blob/59e9b39/organize/organize-personal-todos.md), [organize/organize-work-tasks.md](https://github.com/omars-lab/prompts/blob/59e9b39/organize/organize-work-tasks.md) | Substantial but inseparable from the personal/Amazon folder + workstream structure. |
| [commands/noteplan/generate-weekly-summary.md](https://github.com/omars-lab/prompts/blob/59e9b39/commands/noteplan/generate-weekly-summary.md) | Thin stub. |
| [resume-prompts/check-resume.prompt.md](https://github.com/omars-lab/prompts/blob/59e9b39/resume-prompts/check-resume.prompt.md), [resume-prompts/point-extraction.prompt.md](https://github.com/omars-lab/prompts/blob/59e9b39/resume-prompts/point-extraction.prompt.md) | 1–2 line stubs; `profile-manager:refactor-resume-bullets` is complete. |
| [author/blog-post-structure.md](https://github.com/omars-lab/prompts/blob/59e9b39/author/blog-post-structure.md) | Micro-rule; superseded by the blog-post-structure.md guide above. |
| [rules/task-handling-rules.md](https://github.com/omars-lab/prompts/blob/59e9b39/rules/task-handling-rules.md) | `sweep-daily-notes` already encodes task-hierarchy preservation. |
| [draw/customize-kanban-board.md](https://github.com/omars-lab/prompts/blob/59e9b39/draw/customize-kanban-board.md) | All value is hardcoded SVG coordinates for one file. |
| [research/research-genai-arch-patterns.md](https://github.com/omars-lab/prompts/blob/59e9b39/research/research-genai-arch-patterns.md) | The `deep-research` harness already covers research synthesis; URLs are a one-off note. |
| [heal/fix-portfolio.md](https://github.com/omars-lab/prompts/blob/59e9b39/heal/fix-portfolio.md) | Single React project. |
| [plans/broken-links-resolution-plan.md](https://github.com/omars-lab/prompts/blob/59e9b39/plans/broken-links-resolution-plan.md), [plans/seo-improvement-plan.md](https://github.com/omars-lab/prompts/blob/59e9b39/plans/seo-improvement-plan.md) | One-off outputs, not reusable prompts. |
| [solve/solve-leetcode-and-teach.md](https://github.com/omars-lab/prompts/blob/59e9b39/solve/solve-leetcode-and-teach.md) | 2-line stub. |
