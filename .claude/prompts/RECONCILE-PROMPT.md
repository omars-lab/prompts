# Prompt: Reconcile & Retire the Remaining Prompts

Paste this prompt to drive the next phase. It first produces a plan, then executes a **paragraph-level reconciliation** of every not-migrated prompt against the existing marketplace skills — pruning covered content, migrating genuinely-uncovered content, and removing files that end up empty.

---

## Context you're inheriting

The `prompts` catalog (this repo, `~/Workspace/git/prompts`) is being retired into the **oeid-claude-plugin-marketplace** (`~/Workspace/git/oeid-claude-plugin-marketplace`). A first migration pass is done and recorded in:

- **MIGRATED.md** — the 11 prompts migrated to new skills + 4 merged/folded, with source→destination links.
- **NOT-MIGRATED.md** — 24 prompts dropped, grouped by reason (redundant / project-bound / stub / one-off output).

Those 24 "dropped" prompts were dropped **at the file level** — judged redundant/project-bound as a whole. They have **not** been checked paragraph by paragraph. This phase does that finer pass: a dropped file may still contain a sentence of guidance the existing skill genuinely lacks.

The 24 files still on disk are the not-migrated set (under `analyze/ author/ brainstorm/ commands/ draw/ heal/ organize/ plans/ refactor/ research/ resume-prompts/ rules/ solve/`). Work on a branch; both repos have gitleaks pre-commit/pre-push hooks active.

## Phase 1 — Produce a plan (do this first, in plan mode)

Before editing anything, produce a short plan that:

1. Lists the 24 not-migrated files and, for each, names the **most likely covering skill(s)** in the marketplace (use MIGRATED.md / NOT-MIGRATED.md as the starting hypothesis, but verify against the actual `plugins/*/skills/*/SKILL.md`).
2. States the **reconciliation rules** (below) you'll apply.
3. Flags any file you expect to be **fully covered** (→ likely full removal) vs. **partially covered** (→ prune + migrate remainder) vs. **project-bound with no marketplace home** (→ candidate for a project-level skill in the owning repo, not the shared marketplace).
4. Calls out the destructive steps (file deletions) so they're approved up front.

Get the plan approved before executing.

## Phase 2 — Reconcile each file, paragraph by paragraph

For **each** of the 24 files, walk it **paragraph by paragraph** (treat a heading+its body, a list, or a fenced code block as one unit). For each paragraph:

1. **Find its claim** — what instruction/guidance/rule does this paragraph actually convey? (Ignore boilerplate, restated intent, and project-specific scaffolding that carries no transferable instruction.)
2. **Check coverage** — read the candidate skill(s) and decide: does an existing skill/guide already convey this instruction *as well or better*?
   - **Covered** → delete the paragraph from the prompt file. (The capability lives in the skill; the prompt copy is now dead weight.)
   - **Not covered, transferable** → keep it aside as a **migration candidate** (don't delete yet).
   - **Not covered, project-bound only** (pure hardcoded path/taxonomy/coordinates with no general instruction) → delete it too, and note in NOT-MIGRATED.md that it was project-bound, not migratable. Do **not** force project specifics into a shared skill.
3. Be honest and specific: when you mark a paragraph "covered," name the exact `plugin:skill` (and section) that covers it. When unsure, treat as **not covered** and surface it — don't silently drop guidance.

### After walking a file

- **If migration candidates remain:** decide the proper home. Prefer **enriching the existing covering skill** (via `claude-manager:manage-skills` update-skill) over creating a new skill; create a new skill only if no skill fits. Generalize away hardcoded paths. Then move that prompt's entry in MIGRATED.md from the dropped section to the migrated/merged section, with source→destination links. Run `evaluate-skill` on any skill you touch; bump the plugin version; keep the marketplace's audit (`manage-plugins` evaluate-plugin) clean.
- **If the file is now empty** (every paragraph was covered or project-bound): `git rm` the file. In NOT-MIGRATED.md, replace its entry with a note: *"Fully reconciled — every paragraph was already covered by `<skills>` (or was project-bound); file removed, no longer needed."*
- **If the file still has un-reconciled paragraphs** you couldn't classify: leave the file, and list those paragraphs explicitly for human review rather than guessing.

## Reconciliation rules (the bar)

- **Coverage means instruction-equivalence, not topic-similarity.** "Both mention frontmatter" is not coverage. "The skill already tells you to do X, the same way or better" is coverage.
- **Don't dilute skills.** Never paste a weaker/project-specific paragraph into a mature skill just to "preserve" it. If the skill is already better, the paragraph is redundant — delete it.
- **Project specifics don't go in the shared marketplace.** If guidance only makes sense for one repo (its paths, its workstream taxonomy, its SVG coordinates), its home is a **project-level skill in that repo's `.claude/skills/`**, or it's dropped — not the marketplace.
- **Nothing is silently lost.** Every paragraph ends in one of: deleted-because-covered (skill named), deleted-because-project-bound (noted), or migrated (linked). Git history + MIGRATED.md/NOT-MIGRATED.md preserve the trail.
- **Commit in logical groups**, hooks must pass (gitleaks), and keep MIGRATED.md / NOT-MIGRATED.md accurate as you go.

## Phase 3 — Finish the remaining rollout work

After reconciliation, close out the items still open from the first pass:

- **Install matrix (Phase 7):** enable the right plugins per repo in each target repo's `.claude/settings.json` `enabledPlugins`, per the matrix in `.claude/plans/tender-dreaming-dolphin.md`. (Outward-facing — confirm before editing other repos.)
- **Branch/merge:** merge or PR the `prompts` reconciliation branch; for the marketplace, merge to `main` then publish via `make sync-remote` (the GitHub remote is a protected mirror — never push to it directly).
- **MIGRATED.md destination links:** the marketplace mirror author-rewrites commit SHAs on sync, so per-commit destination permalinks drift. Point destination links at the mirror's stable `main` paths instead of a specific SHA.

## Definition of done

- Every one of the 24 files is either removed (fully reconciled) or left with only explicitly-flagged, human-review paragraphs.
- MIGRATED.md and NOT-MIGRATED.md reflect the final reality (no paragraph unaccounted for).
- Any skill touched passes `evaluate-skill`; the marketplace passes `evaluate-plugin`; versions bumped.
- Both repos' working trees are clean, committed, hooks green, and changes pushed (marketplace via `make sync-remote`).
