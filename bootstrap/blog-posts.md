# Front Matter Validation and Fixing Prompt

## Objective
Find and fix all markdown/mdx files in `/Users/omareid/Workspace/git/projects/omars-lab.github.io/bytesofpurpose-blog` that are missing proper front matter or have minimal content (placeholder posts). Focus on recently modified and untracked files as they are most likely to have issues.

## Directory-Specific Front Matter Patterns

### Blog Posts (`/blog/`)
```yaml
---
slug: [filename-without-date]
title: '[emoji] Title'
description: 'Brief description of the post content'
authors: [oeid]
tags: [relevant, tags, here]
date: 'YYYY-MM-DDTHH:MM'
draft: false
---
```

### Documentation (`/docs/`)
```yaml
---
slug: [filename-without-extension]
title: 'Title'
description: 'Brief description of the content'
authors: [oeid]
tags: [relevant, tags, here]
draft: false
---
```

### Design Posts (`/designs/`)
```yaml
---
slug: [filename-without-date]
title: 'Title'
description: 'Brief description of the design content'
authors: [oeid]
tags: [design, relevant, tags]
date: 'YYYY-MM-DDTHH:MM'
draft: false
---
```

### Technique/Content Files (`/docs/7-techniques/`)
```yaml
---
summary: "Brief description of the technique"
---
```

## Detection Criteria

### Files to Fix (High Priority)
1. **Missing front matter entirely** - Files starting with `#` or content without `---` delimiters
2. **Recently modified files** - Check git status for modified/untracked files
3. **Minimal content files** - Files with < 200 characters or mostly links/bullet points
4. **Placeholder posts** - Files that are just conglomerated links without narrative

### Content Quality Indicators (Low Priority)
- Files with only bullet points and links
- Files without proper narrative structure
- Files that read like notes rather than polished content

## Execution Steps

1. **Scan for problematic files**:
   - Find all `.md` and `.mdx` files in the target directory
   - Check git status for recently modified files
   - Identify files starting with `#` (missing front matter)
   - Flag files with minimal content (< 200 chars)

2. **Analyze existing patterns**:
   - Examine 3-5 good examples from each directory type
   - Extract the common front matter patterns
   - Note any directory-specific requirements

3. **Fix front matter issues**:
   - Add appropriate front matter based on directory location
   - Use consistent formatting and required fields
   - Ensure proper slug generation from filename
   - Add appropriate tags based on content analysis
   - **DO NOT EDIT FILE CONTENT** - Only add/update front matter

4. **Handle minimal content files**:
   - For files with very minimal content, add a single section with "Top 3 Questions This Post Should Address"
   - Keep existing content intact
   - Only add the questions section if content is extremely minimal (< 100 characters)

5. **Validate fixes**:
   - Ensure all files have proper front matter
   - Check that slugs are properly formatted
   - Verify required fields are present
   - Confirm directory-specific patterns are followed

## Required Fields by Directory

### Blog Posts
- `slug` (from filename, remove date prefix)
- `title` (with emoji prefix)
- `description` (compelling, 50-100 chars)
- `authors` (always [oeid])
- `tags` (3-5 relevant tags)
- `date` (ISO format)
- `draft` (false for published)

### Documentation
- `slug` (from filename)
- `title` (clear and descriptive)
- `description` (brief explanation)
- `authors` (always [oeid])
- `tags` (relevant to content)
- `draft` (false for published)

### Design Posts
- `slug` (from filename, remove date prefix)
- `title` (clear and descriptive)
- `description` (brief explanation)
- `authors` (always [oeid])
- `tags` (include 'design' tag)
- `date` (ISO format)
- `draft` (false for published)

### Technique Files
- `summary` (brief description of the technique)

## Content Preservation Rules

- **DO NOT EDIT EXISTING CONTENT** - Only add or update front matter
- **Preserve all existing text** - Keep bullet points, links, and notes intact
- **For minimal content files** (< 100 characters): Add a single section at the end:
  ```markdown
  ## Top 3 Questions This Post Should Address
  
  1. [Question 1 based on filename/title]
  2. [Question 2 based on filename/title] 
  3. [Question 3 based on filename/title]
  ```
- **Maintain original structure** - Don't reorganize or rewrite content

## Quality Standards

- **Consistency**: All files in same directory should follow same pattern
- **Completeness**: No missing required fields
- **Accuracy**: Slugs match filenames, titles are descriptive
- **Relevance**: Tags and descriptions match content
- **Formatting**: Proper YAML syntax, consistent indentation
- **Content Preservation**: Original content remains untouched

## Validation Checklist

- [ ] All files have front matter delimited by `---`
- [ ] Required fields are present for each directory type
- [ ] Slugs are properly formatted and match filenames
- [ ] Titles are descriptive and include emojis where appropriate
- [ ] Descriptions are compelling and 50-100 characters
- [ ] Tags are relevant and properly formatted
- [ ] Dates are in ISO format (YYYY-MM-DDTHH:MM)
- [ ] No syntax errors in YAML front matter
- [ ] Recently modified files are prioritized and fixed
- [ ] Placeholder/minimal content files are identified and improved
- [ ] **Original content preserved** - No existing text modified
- [ ] **Minimal content files** have "Top 3 Questions" section added (if < 100 chars)
- [ ] **Content structure maintained** - Bullet points, links, and notes kept intact

## Output Format

For each file processed, provide:
1. **File path**
2. **Issue identified** (missing front matter, minimal content, etc.)
3. **Front matter added/fixed** (show the complete front matter)
4. **Content improvements** (if applicable)

Focus on recently modified and untracked files first, as these are most likely to be placeholder posts that need proper front matter.
