# Heal Blog Changelog - Infer and Enrich Changelog Entries from Git History

## Overview
Your job is to analyze git commit history to identify major features, mechanics, and components that should be tracked in the changelog, then create or update changelog entries with accurate dates and execution details based on actual git commits.

**IMPORTANT**: This prompt helps maintain an accurate changelog by syncing it with actual git history, ensuring changelog entries reflect when work was actually done and what was accomplished.

## Step 1: Analyze Git History for Missing Features

### A. Search for Major Features in Git Commits

Use these commands to identify major features that might be missing from the changelog:

```bash
cd /Users/omareid/Workspace/git/projects/omars-lab.github.io

# Search for major features/mechanics in commit messages
git log --all --pretty=format:"%H|%ai|%s" --since="2024-01-01" | grep -iE "storybook|changelog|roadmap|mermaid|search|seo|infrastructure|deploy|ci|cdk|component|mechanic|frontmatter" | head -50

# Search for component-related commits
git log --all --pretty=format:"%H|%ai|%s" --since="2024-01-01" --grep="component\|create\|add" -i | head -30

# Search for infrastructure-related commits
git log --all --pretty=format:"%H|%ai|%s" --since="2024-01-01" --grep="infrastructure\|build\|deploy\|ci\|cdk" -i | head -30

# Search for mechanic-related commits
git log --all --pretty=format:"%H|%ai|%s" --since="2024-01-01" --grep="mechanic\|mechanism\|workflow\|process" -i | head -30
```

### B. Use the Changelog Commit Extraction Script

The repository has a script to help identify commits related to changelog entries:

```bash
cd bytesofpurpose-blog

# Analyze all changelog files
node scripts/extract-changelog-commits.js

# Analyze specific changelog file
node scripts/extract-changelog-commits.js 2025-XX-XX-component-refactoring-graph-renderer.md
```

This script will:
- Match commits by keywords in commit messages
- Match commits by file patterns
- Suggest updated inception_date and execution_date
- List all matching commits with dates and subjects

**Note:** The script may include false positives. Manual review is required to filter out unrelated commits.

### C. Identify Missing Features

Look for patterns indicating major features that aren't in the changelog:

1. **Component Creation**: Commits mentioning "Adding [Component]", "Create [Component]"
2. **Mechanic Establishment**: Commits mentioning "mechanism", "workflow", "process"
3. **Infrastructure Changes**: Commits mentioning "infrastructure", "build", "deploy", "ci", "cdk"
4. **Tool Integration**: Commits mentioning tool names (Storybook, Mermaid, etc.)
5. **System Features**: Commits mentioning system-wide features (changelog, search, SEO)

## Step 2: Update Existing Changelog Entries with Git Commits

### A. For Each Changelog Entry, Find Related Commits

```bash
# Example: Find commits related to graph component
git log --all --pretty=format:"%H|%ai|%s" --since="2024-11-01" --grep="graph" -i

# Example: Find commits touching specific files
git log --all --pretty=format:"%H|%ai|%s" --since="2024-11-01" -- "bytesofpurpose-blog/src/components/Graph/**/*"

# Get detailed commit information
git show <commit-hash> --stat
```

### B. Update Changelog Entry Frontmatter

For each changelog entry, update:

1. **inception_date**: Use earliest relevant commit date
   - Format: `YYYY-MM-DD` for specific dates
   - Use `YYYY-MM-XX` if only month is known
   - Use `YYYY-XX-XX` if date is truly unknown

2. **execution_date**: Use latest relevant commit date (if work is completed/in-progress)
   - For completed work: use latest commit date
   - For in-progress work: use latest commit date
   - For planned work: keep `TBD`

3. **status**: Update based on commit activity
   - If commits found after execution_date: `in-progress`
   - If no commits found: `planned`
   - If commits completed: `completed`

### C. Add Execution Details to Changelog Entry

Update the "Execution Results / Attempts" section with:

```markdown
## Execution Results / Attempts

### ✅ Work Completed (YYYY-MM-DD to YYYY-MM-DD)

**Work Period:** [start date] to [end date]

**Commits:** [count] commits related to [feature]

**Key Accomplishments:**
- [Achievement 1]
- [Achievement 2]
- [Achievement 3]

**Notable Commits:**
- `[hash]` ([date]): [commit message]
- `[hash]` ([date]): [commit message]

**Status:** [Current status and summary]
```

## Step 3: Create New Changelog Entries for Missing Features

### A. Identify Features That Need New Entries

Look for:
- Major features mentioned in commits but not in changelog
- Tool integrations (Storybook, Mermaid, etc.)
- Component creations
- Mechanic establishments
- Infrastructure improvements

### B. Determine Entry Type and Naming

Follow the naming convention from `NAMING_CONVENTIONS.md`:

- **Components**: `component-{action}-{component-name}`
  - Actions: `creation`, `enhancement`, `refactoring`
- **Mechanics**: `mechanic-{action}-{mechanic-name}`
  - Actions: `establishment`, `enhancement`, `refactoring`
- **Infrastructure**: `infrastructure-improvement-{descriptor}`
- **Structure**: `structure-{descriptor}`
- **Plans**: `plan-{descriptor}`
- **Content Posts**: `content-post-{descriptor}`

### C. Create Changelog Entry File

Create a new file in `bytesofpurpose-blog/changelog/` with format:

```markdown
---
title: '[Feature Title]'
description: '[Description of the feature]'
status: '[planned|in-progress|completed|cancelled]'
inception_date: 'YYYY-MM-DD'
execution_date: 'YYYY-MM-DD' or 'TBD'
type: '[feature|refactoring|bugfix|documentation|infrastructure]'
component: '[Component Name]' (optional)
priority: '[low|medium|high|critical]'
---

# [Feature Title]

## Execution Plan

[Plan details]

## Execution Results / Attempts

### ✅ Work Completed (YYYY-MM-DD to YYYY-MM-DD)

[Execution details with commits]
```

## Step 4: Verify and Regenerate Changelog Data

### A. Verify All Entries

```bash
# Check that all changelog files are valid
cd bytesofpurpose-blog
find changelog -name "*.md" -type f | while read file; do
  echo "Checking: $file"
  # Verify frontmatter exists
  head -n 10 "$file" | grep -q "^---$" || echo "  ⚠️  Missing frontmatter"
done
```

### B. Regenerate Changelog Data

After creating or updating changelog entries:

```bash
cd bytesofpurpose-blog
node scripts/generate-changelog-data.js
```

This will:
- Scan all changelog files
- Parse frontmatter
- Generate `src/components/Changelog/changelog-data.json`
- Update the changelog page data

## Step 5: Common Patterns and Examples

### Pattern 1: Component Creation

**Git Evidence:**
- Commits mentioning component creation
- Files created in `src/components/`

**Example Entry:**
```markdown
---
title: 'Card and Timeline Components Creation'
description: 'Create reusable Card and Timeline components for blog content display'
status: 'completed'
inception_date: '2025-09-23'
execution_date: '2025-09-23'
type: 'feature'
component: 'Card, Timeline'
priority: 'medium'
---
```

### Pattern 2: Mechanic Establishment

**Git Evidence:**
- Commits mentioning mechanism/workflow establishment
- Scripts or tools created

**Example Entry:**
```markdown
---
title: 'Blogging Mechanism - Storybook Component Documentation'
description: 'Establish Storybook as a component development and documentation tool'
status: 'completed'
inception_date: '2025-11-16'
execution_date: '2025-11-17'
type: 'feature'
component: 'Infrastructure'
priority: 'high'
---
```

### Pattern 3: Updating Existing Entry

**Before:**
```markdown
---
status: 'planned'
inception_date: '2025-01-20'
execution_date: 'TBD'
---

## Execution Results / Attempts

### Status: Not Started
```

**After:**
```markdown
---
status: 'in-progress'
inception_date: '2025-09-10'
execution_date: '2025-09-15'
---

## Execution Results / Attempts

### ✅ Work Completed (2025-09-10 to 2025-09-15)

**Work Period:** September 10, 2025 to September 15, 2025

**Commits:** 3 commits related to [feature]

**Notable Commits:**
- `[hash]` (2025-09-10): [commit message]
- `[hash]` (2025-09-15): [commit message]

**Status:** [Summary]
```

## Step 6: Success Criteria

### Complete Success
- ✅ All major features from git history are tracked in changelog
- ✅ All changelog entries have accurate dates based on git commits
- ✅ Execution details include relevant commit information
- ✅ Changelog data regenerated successfully
- ✅ No broken references or invalid frontmatter

### Verification Commands

```bash
# Verify changelog data generation works
cd bytesofpurpose-blog
node scripts/generate-changelog-data.js

# Check for any changelog files with issues
find changelog -name "*.md" -type f | while read file; do
  if ! head -n 10 "$file" | grep -q "^---$"; then
    echo "Missing frontmatter: $file"
  fi
done

# Test build
make build
```

## Important Guidelines

### Do's
- ✅ **Verify commits are actually related** before updating changelog entries
- ✅ **Use earliest commit date** for inception_date
- ✅ **Use latest commit date** for execution_date (if work is done)
- ✅ **Include commit hashes** in execution details for traceability
- ✅ **Update status** based on actual commit activity
- ✅ **Filter out false positives** from commit matching

### Don'ts
- ❌ **Don't update dates** without verifying commits are related
- ❌ **Don't create duplicate entries** - check if entry already exists
- ❌ **Don't ignore false positives** - manually review all matches
- ❌ **Don't skip regeneration** - always regenerate changelog data after changes

## Related Resources

- **Naming Conventions**: See `NAMING_CONVENTIONS.md` for changelog entry naming
- **Changelog System Documentation**: See `docs/6-techniques/3-blogging-techniques/changelog-system.md`
- **Sync Plan**: See `docs/6-techniques/3-blogging-techniques/changelog-sync-with-git-plan.md`
- **Extract Script**: `bytesofpurpose-blog/scripts/extract-changelog-commits.js`

## Example Workflow

1. **Run extraction script** to get initial commit matches
   ```bash
   cd bytesofpurpose-blog
   node scripts/extract-changelog-commits.js
   ```

2. **Review matches** and filter out false positives

3. **For each changelog entry**:
   - Verify commits are related
   - Update frontmatter dates
   - Add execution details with commits
   - Update status if needed

4. **For missing features**:
   - Identify from git history
   - Create new changelog entry
   - Add execution details

5. **Regenerate changelog data**:
   ```bash
   node scripts/generate-changelog-data.js
   ```

6. **Verify**:
   - Check changelog page displays correctly
   - Verify dates are accurate
   - Ensure no broken entries

---

**Last Updated**: 2025-01-20
**Purpose**: Maintain accurate changelog by syncing with git commit history
**Frequency**: Run periodically to keep changelog up-to-date with actual work

