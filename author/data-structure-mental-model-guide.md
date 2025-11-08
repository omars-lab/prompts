# Data Structure Mental Model Guide Author Prompt

## Purpose
This prompt establishes the comprehensive structure and methodology for creating data structure mental model guides that provide complete, actionable understanding of data structures and algorithms.

## Core Guide Structure

Every data structure mental model guide MUST follow this exact structure:

### 1. Frontmatter Section
```yaml
---
slug: 'understanding-[data-structure]'
title: 'Understanding [Data Structure]: A Complete Mental Model for [Primary Use Case] and Problem-Solving'
description: 'A comprehensive guide covering [key aspects], [problem patterns], and practical applications with real LeetCode examples.'
authors: [oeid]
tags: [data-structures, algorithms, [specific-tags], computer-science, [pattern-tags]]
date: 'YYYY-MM-DDTHH:MM'
draft: false
---
```

**Frontmatter Requirements:**
- `slug`: Unique identifier, URL-friendly, no spaces
- `title`: Clear, descriptive title with "Complete Mental Model" and primary use case
- `description`: One sentence covering key aspects, patterns, and LeetCode examples
- `authors`: Always `[oeid]` for this repository
- `tags`: 5-7 relevant tags including specific data structure and pattern tags
- `date`: ISO format with time
- `draft`: false for published content

### 2. Title and Description
```markdown
# Understanding [Data Structure]: A Complete Mental Model for [Primary Use Case] and Problem-Solving

[Comprehensive description covering key aspects, patterns, and practical applications with real LeetCode examples]
```

### 3. Purpose Section
```markdown
## Purpose

This guide was created to address four critical needs:

- **I need to understand [data structure] fundamentals**: Learn the core properties, types, and characteristics of [data structure] data structures
- **I need to master [data structure] operations**: Implement and understand [key operations] and their variations for different problem types
- **I need to apply [data structure] practically**: Use [data structure] in real-world scenarios like [specific applications]
- **I need to solve [data structure]-based problems**: Tackle coding challenges that require [data structure] knowledge and optimization

The goal is to transform confusion about [data structure] data structures into clear, systematic problem-solving skills through structured learning and pattern recognition.
```

**Purpose Section Requirements:**
- Always use "I need to..." format for each bullet point
- Address 4 specific needs or goals
- Include a goal statement that frames the entire guide
- Be specific and actionable

### 4. Core Concepts Section
```markdown
## What are [Data Structures]?

[Clear definition and explanation of the data structure]

### Key Properties

✅ **Property 1**: [Description]
✅ **Property 2**: [Description]
✅ **Property 3**: [Description]
✅ **Property 4**: [Description]
```

### 5. Types and Classifications Section
```markdown
## Types of [Data Structure]: A Comprehensive Classification

Understanding the different types of [data structure] is crucial for choosing the right algorithms and data structures. Each type has unique properties that affect how we can traverse, analyze, and solve problems on them.

### 1. [Type 1] vs [Type 2]

#### [Type 1]
[Visual representation with ASCII art]
**Key Properties**:
- [Property 1]
- [Property 2]
- [Property 3]

**When to use**:
- [Use case 1]
- [Use case 2]
- [Use case 3]

**LeetCode Examples**:
- [Problem 1](link) - [Description]
- [Problem 2](link) - [Description]
```

### 6. Core Operations Section
```markdown
## Core Operations

### 1. [Operation 1]
```python
def operation_1():
    # Implementation with clear comments
    pass
```

### 2. [Operation 2]
```python
def operation_2():
    # Implementation with clear comments
    pass
```
```

### 7. Advanced Patterns Section
```markdown
## [Data Structure] Problem Patterns

### Pattern 1: [Pattern Name]

**When to use**: [Description]
**Approach**: [Methodology]

```python
def pattern_1():
    # Implementation
    pass
```

**LeetCode Examples**:
- [Problem 1](link) - [Description]
- [Problem 2](link) - [Description]
```

### 8. Key Distinctions Section
```markdown
## Key Distinctions: [Data Structure] vs Other Data Structures

Understanding the fundamental differences between [data structure] and other data structures is crucial for choosing the right approach to solve problems.

### [Data Structure] vs [Similar Structure 1]

**❌ Common Misconception**: "[Misconception statement]"

**✅ Reality**: "[Accurate explanation]"

#### Key Differences

| Aspect | [Data Structure] | [Similar Structure] |
|--------|-----------------|-------------------|
| **Property 1** | [Value] | [Value] |
| **Property 2** | [Value] | [Value] |
| **Property 3** | [Value] | [Value] |

#### Visual Comparison

**[Data Structure] Example**:
```
[ASCII art representation]
```
- **Property**: [Description]
- **Access**: [Description]
- **Insert**: [Description]
- **Delete**: [Description]

**[Similar Structure] Example**:
```
[ASCII art representation]
```
- **Property**: [Description]
- **Access**: [Description]
- **Insert**: [Description]
- **Delete**: [Description]

#### When to Use Each

**Use [Data Structure] when**:
- [Use case 1]
- [Use case 2]
- [Use case 3]

**Use [Similar Structure] when**:
- [Use case 1]
- [Use case 2]
- [Use case 3]

**LeetCode Examples**:
- **[Data Structure] Problems**: [Problem](link) - [Description]
- **[Similar Structure] Problems**: [Problem](link) - [Description]
```

### 9. Implementation Considerations Section
```markdown
## Implementation Considerations

### [Consideration 1]
- [Detail 1]
- [Detail 2]

### [Consideration 2]
- [Detail 1]
- [Detail 2]
```

### 10. Common Mistakes Section
```markdown
## Common Mistakes to Avoid

❌ **[Mistake 1]** - [Explanation]
❌ **[Mistake 2]** - [Explanation]
❌ **[Mistake 3]** - [Explanation]
```

### 11. Comparison Table Section
```markdown
## [Data Structure] vs Other Data Structures

| Operation | [Data Structure] | [Alternative 1] | [Alternative 2] |
|-----------|-----------------|-----------------|-----------------|
| [Operation 1] | [Complexity] | [Complexity] | [Complexity] |
| [Operation 2] | [Complexity] | [Complexity] | [Complexity] |
| [Operation 3] | [Complexity] | [Complexity] | [Complexity] |
| Use Case | [Description] | [Description] | [Description] |
```

### 12. Action Items Section
```markdown
## Action Items

This section contains specific action items that readers can take to enhance their understanding or apply the concepts from this post:

- [ ] **Action Item 1**: [Specific, actionable task with clear outcome]
- [ ] **Action Item 2**: [Another specific task that builds on the content]
- [ ] **Action Item 3**: [Optional third action item if relevant]
- [ ] **Action Item 4**: [Optional fourth action item if relevant]

**Implementation Notes:**
- Each action item should be specific and measurable
- Include expected outcomes or deliverables
- Consider different skill levels (beginner, intermediate, advanced)
- Provide context for why each action item is valuable
```

### 13. AI Metadata Section
```html
<details>
<summary>🤖 AI Metadata (Click to expand)</summary>

```yaml
# AI METADATA - DO NOT REMOVE OR MODIFY
# AI_UPDATE_INSTRUCTIONS:
# This content should be updated when new [data structure] algorithms, problem patterns, or optimization techniques emerge
#
# 1. SCAN_SOURCES: Monitor algorithm textbooks, competitive programming resources, LeetCode [data structure] problems, and [data structure] research papers
# 2. EXTRACT_DATA: Look for new [data structure] types, problem patterns, optimization strategies, and real-world applications
# 3. UPDATE_CONTENT: Add new [data structure] types, update algorithm implementations, include new LeetCode problems, expand problem patterns
# 4. VERIFY_CHANGES: Ensure all code examples compile and run correctly, verify algorithm complexity claims, test LeetCode links
# 5. MAINTAIN_FORMAT: Preserve the "I need to..." format in Purpose section, keep action items specific and measurable
#
# CONTENT_PATTERNS:
# - [Data structure] types: Include characteristics, use cases, pros/cons, when to use each type
# - Problem patterns: Cover [pattern 1], [pattern 2], [pattern 3] with examples
# - Algorithm implementations: Always include time/space complexity, both recursive and iterative approaches
# - Code examples: Use clear variable names, include comments, provide pattern templates
# - Problem patterns: Include both theoretical understanding and practical implementation with real examples
#
# DATA_SOURCES:
# - Algorithm textbooks: Introduction to Algorithms (CLRS), Algorithm Design Manual, Competitive Programming Handbook
# - Competitive programming: Codeforces [data structure] problems, AtCoder [data structure] contests, TopCoder algorithm tutorials
# - Coding platforms: LeetCode [data structure] problems, HackerRank data structures, GeeksforGeeks [data structure] section
# - Research papers: [Data structure] optimization techniques, advanced [data structure] implementations, algorithmic improvements
# - University courses: MIT 6.006, Stanford CS161, Princeton algorithms
#
# UPDATE_TRIGGERS:
# - New [data structure] algorithms published in computer science literature
# - Changes in competitive programming [data structure] problem patterns
# - New LeetCode [data structure] problems with different difficulty levels
# - Performance improvements in [data structure] implementations and optimizations
# - New real-world applications of [data structure] data structures
# - Updates to [data structure] libraries and frameworks
#
# FORMATTING_RULES:
# - Use ✅ and ❌ for good/bad examples consistently
# - Include code blocks with proper syntax highlighting (python, markdown)
# - Maintain table formatting for comparisons and algorithm selection guides
# - Keep action items in checkbox format with implementation notes
# - Include LeetCode links with descriptive text
# - Use pattern templates for different [data structure] problem types
#
# UPDATE_FREQUENCY: Monthly review for new LeetCode problems, quarterly review for algorithms, annual review for comprehensive updates
```

</details>
```

## Content Guidelines

### Writing Style
- Clear, actionable, and practical
- Use "you" to address the reader directly
- Include specific examples and frameworks
- Balance between comprehensive and concise

### Formatting Standards
- Use proper markdown headers (##, ###, ####)
- Include visual indicators for examples (✅, ❌, ⚠️)
- Use tables for structured data (comparisons, rubrics)
- Include code blocks for technical content
- Use bullet points and numbered lists appropriately

### Examples and Frameworks
- Provide both good and bad examples where applicable
- Include grading rubrics or evaluation criteria
- Use concrete, specific examples rather than abstract concepts
- Include metrics and quantifiable outcomes when possible

### LeetCode Integration
- Include 8-12 LeetCode problems per guide
- Provide direct links with descriptive text
- Cover different difficulty levels (Easy, Medium, Hard)
- Include problems that demonstrate different patterns
- Explain why each problem is relevant to the data structure

## Quality Checklist

Before publishing any data structure mental model guide, ensure:

- [ ] Frontmatter follows the exact format specified
- [ ] Purpose section uses "I need to..." format
- [ ] Core concepts are clearly explained with examples
- [ ] Types and classifications are comprehensive
- [ ] Key distinctions section addresses common misconceptions
- [ ] Problem patterns are well-documented with examples
- [ ] LeetCode problems are relevant and well-linked
- [ ] Action items section includes 3-4 specific, measurable tasks
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
- `/prompts/author/blog-post-structure.md` - For general blog post structure

## Maintenance Instructions

AI agents updating data structure mental model guides should:
1. Always maintain the core structure (Frontmatter → Title → Purpose → Core Concepts → Types → Operations → Patterns → Distinctions → Implementation → Mistakes → Comparison → Action Items → AI Metadata)
2. Update the AI metadata section when content changes
3. Preserve the "I need to..." format in Purpose sections
4. Include specific, measurable action items in the Action Items section
5. Keep the collapsible AI metadata format
6. Update dates and version information as needed
7. Ensure LeetCode links are current and working
8. Add new problem patterns as they emerge

## Examples

### Good Data Structure Mental Model Guide Structure
```markdown
---
slug: 'understanding-heaps'
title: 'Understanding Heaps: A Complete Mental Model for Data Structure Mastery and Problem-Solving'
description: 'A comprehensive guide covering heap types, operations, problem patterns (top-k, sliding window, median finding), and practical applications with real LeetCode examples.'
authors: [oeid]
tags: [data-structures, algorithms, heaps, priority-queues, computer-science, top-k, sliding-window, median-finding]
date: '2025-01-31T10:00'
draft: false
---

# Understanding Heaps: A Complete Mental Model for Data Structure Mastery and Problem-Solving

[Comprehensive description]

## Purpose
[I need to... format with 4 specific needs]

## What are Heaps?
[Core concepts with key properties]

## Types of Heaps: A Comprehensive Classification
[Different heap types with examples]

## Core Operations
[Key operations with implementations]

## Heap Problem Patterns
[Common patterns with LeetCode examples]

## Key Distinctions: Heaps vs Other Data Structures
[Detailed comparisons with misconceptions]

## Implementation Considerations
[Practical implementation details]

## Common Mistakes to Avoid
[Common pitfalls and how to avoid them]

## Heap vs Other Data Structures
[Comparison table]

## Action Items
[Specific, measurable tasks]

<details>
<summary>🤖 AI Metadata (Click to expand)</summary>
[Comprehensive AI metadata]
</details>
```

---

**Last Updated**: 2025-01-31
**Version**: 1.0
**Status**: Active - Use for all new data structure mental model guides
