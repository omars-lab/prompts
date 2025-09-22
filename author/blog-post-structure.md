# Blog Post Structure Author Prompt

## Purpose
This prompt establishes the core structure and formatting requirements for all blog posts in the omars-lab.github.io repository, ensuring consistency and maintainability across all content.

## Core Blog Post Structure

Every blog post MUST follow this exact structure:

### 1. Frontmatter Section
```yaml
---
slug: 'unique-blog-slug'
title: 'Blog Post Title'
description: 'One sentence description of the blog post content'
authors: [oeid]
tags: [tag1, tag2, tag3]
date: 'YYYY-MM-DDTHH:MM'
draft: false
---
```

**Frontmatter Requirements:**
- `slug`: Unique identifier, URL-friendly, no spaces
- `title`: Clear, descriptive title
- `description`: One sentence summarizing the core question or purpose
- `authors`: Always `[oeid]` for this repository
- `tags`: SEO-friendly terms, 3-5 relevant tags
- `date`: ISO format with time (no seconds)
- `draft`: `false` for blog posts, `true` for work-in-progress docs

### 2. Title and Description
```markdown
# [Title]

[Brief description of what the post covers]
```

### 3. Purpose Section
```markdown
## Purpose

This [guide/article/post] was created to address [number] critical [needs/goals]:

- **I need to [specific need 1]**: [Explanation of what this addresses]
- **I need to [specific need 2]**: [Explanation of what this addresses]
- **I need to [specific need 3]**: [Explanation of what this addresses]

The goal is to [transform/achieve/address] [specific outcome].
```

**Purpose Section Requirements:**
- Always use "I need to..." format for each bullet point
- Address 2-4 specific needs or goals
- Include a goal statement that frames the entire post
- Be specific and actionable

### 4. Main Content
- Comprehensive, actionable content
- Examples and frameworks where applicable
- Clear structure with proper markdown headers
- Use of visual indicators (✅, ❌, etc.) for examples
- Tables, code blocks, and other formatting as needed

### 5. AI Metadata Section
```html
<details>
<summary>🤖 AI Metadata (Click to expand)</summary>

```yaml
# AI METADATA - DO NOT REMOVE OR MODIFY
# AI_UPDATE_INSTRUCTIONS:
# [Specific instructions for AI agents on how to maintain this content]
#
# 1. SCAN_SOURCES: [What to monitor for changes]
# 2. EXTRACT_DATA: [What data to extract and how]
# 3. UPDATE_CONTENT: [How to update the content]
# 4. VERIFY_CHANGES: [How to verify updates are correct]
# 5. MAINTAIN_FORMAT: [How to preserve formatting and structure]
#
# CONTENT_PATTERNS:
# - [Pattern 1]: [Description and examples]
# - [Pattern 2]: [Description and examples]
#
# DATA_SOURCES:
# - [Source 1]: [Path and description]
# - [Source 2]: [Path and description]
#
# UPDATE_TRIGGERS:
# - [Trigger 1]: [When this should trigger an update]
# - [Trigger 2]: [When this should trigger an update]
#
# FORMATTING_RULES:
# - [Rule 1]: [How to maintain consistent formatting]
# - [Rule 2]: [How to maintain consistent formatting]
#
# UPDATE_FREQUENCY: [How often this should be checked/updated]
```

</details>
```

**AI Metadata Requirements:**
- Must be collapsible (hidden by default)
- Follow the exact format from `/prompts/meta/inject-ai-metadata.md`
- Include comprehensive update instructions for AI agents
- Specify content patterns, data sources, and update triggers
- Define formatting rules to maintain consistency

## Content Guidelines

### Writing Style
- Clear, actionable, and practical
- Use "you" to address the reader directly
- Include specific examples and frameworks
- Balance between comprehensive and concise

### Formatting Standards
- Use proper markdown headers (##, ###, ####)
- Include visual indicators for examples (✅, ❌, ⚠️)
- Use tables for structured data (rubrics, comparisons)
- Include code blocks for technical content
- Use bullet points and numbered lists appropriately

### Examples and Frameworks
- Provide both good and bad examples where applicable
- Include grading rubrics or evaluation criteria
- Use concrete, specific examples rather than abstract concepts
- Include metrics and quantifiable outcomes when possible

## Quality Checklist

Before publishing any blog post, ensure:

- [ ] Frontmatter follows the exact format specified
- [ ] Purpose section uses "I need to..." format
- [ ] Main content is comprehensive and actionable
- [ ] AI metadata section is properly formatted and collapsible
- [ ] All examples are specific and concrete
- [ ] Content follows the established writing style
- [ ] Proper markdown formatting throughout
- [ ] Links and references are accurate
- [ ] Tags are relevant and SEO-friendly

## Integration with Other Prompts

This structure integrates with:
- `/prompts/meta/inject-ai-metadata.md` - For AI metadata formatting
- `/prompts/heal/fix-frontmatter.md` - For frontmatter validation

## Maintenance Instructions

AI agents updating blog posts should:
1. Always maintain the core structure (Frontmatter → Title → Purpose → Content → AI Metadata)
2. Update the AI metadata section when content changes
3. Preserve the "I need to..." format in Purpose sections
4. Keep the collapsible AI metadata format
5. Update dates and version information as needed

## Examples

### Good Blog Post Structure
```markdown
---
slug: 'example-blog-post'
title: 'Example Blog Post'
description: 'A comprehensive guide for achieving specific goals'
authors: [oeid]
tags: [example, guide, tutorial]
date: '2025-01-31T10:00'
draft: false
---

# Example Blog Post

A comprehensive guide for achieving specific goals.

## Purpose

This guide was created to address three critical needs:

- **I need to understand the basics**: Learn fundamental concepts and terminology
- **I need to implement solutions**: Apply practical frameworks and techniques
- **I need to measure success**: Track progress and validate outcomes

The goal is to transform confusion into clarity through structured learning.

## Main Content
[Comprehensive content here]

<details>
<summary>🤖 AI Metadata (Click to expand)</summary>
[AI metadata here]
</details>
```

### Bad Blog Post Structure
```markdown
# Bad Example
No frontmatter, no purpose section, no AI metadata
```

## Success Criteria

A blog post following this structure should:
- Be immediately recognizable as part of the omars-lab.github.io repository
- Provide clear value to readers through structured, actionable content
- Be maintainable by AI agents through comprehensive metadata
- Follow consistent formatting and style guidelines
- Include proper frontmatter for Docusaurus integration

---

**Last Updated**: 2025-01-31
**Version**: 1.0
**Status**: Active - Use for all new blog posts
