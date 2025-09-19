# Role Refactoring Prompt

Use this prompt to clean up and organize any role in your personal book system. This approach separates generic role frameworks from personal action items, creating a more organized and actionable structure.

## Instructions

For the specified role directory, perform the following refactoring:

### 0. Comprehensive File Discovery and Validation
**CRITICAL**: Before making any changes, perform complete file discovery and validation:

1. **Complete File Inventory**:
   - Use `list_dir` to get a complete inventory of ALL files and directories
   - Read ALL files in the role directory to understand the full scope
   - Document every file that needs to be processed
   - Check for nested directories and subdirectories

2. **Content Analysis**:
   - Use `grep` searches to find content patterns across all files
   - Identify all planning questions that need to be moved to Activities.md
   - Find all personal todos and action items that should stay in individual files
   - Locate any references, links, or tidbits that need to be preserved
   - Identify any role synonyms or historical context
   - Check for "Extends/" directories or role extension patterns
   - Identify which roles this role extends and how it enhances them

3. **Validation Steps**:
   - After each batch of changes, verify files were actually updated
   - Use `grep` to check for remaining planning questions that should have been moved
   - Verify all files have been properly structured
   - Check for any files that still contain content that should be reorganized
   - Ensure no content was lost during the refactoring process

4. **Error Handling**:
   - When a user rejects changes, immediately investigate what went wrong
   - Re-read the file to understand the current state
   - Apply the correct changes based on the actual file content
   - Double-check file counts before and after processing

5. **Quality Assurance**:
   - Verify all activity files have been properly structured
   - Ensure no files were missed or skipped
   - Confirm all planning content was moved to Activities.md
   - Validate that personal content was preserved in individual files
   - Check that all references and links were maintained

### 1. Create Activities.md
Create a new `Activities.md` file in the role directory that contains:

- **Core Activities**: List all the main activities performed by this role
- **Essence**: For each activity, provide a brief description of what it means generically
- **Planning Questions**: Include all relevant planning questions that any person in this role would ask themselves
- **Organize by importance**: Most critical questions first, least critical last
- **Use indentation for dependencies**: Sub-questions that depend on main questions should be indented
- **Group related questions**: Questions that build on each other should be grouped together

**Structure for each activity:**
```markdown
## [Activity Number]. [Activity Name]

**Essence**: [Brief description of what this activity means generically]

**Planning Questions**:
- [Most important question that must be answered first]
  - [Sub-question that depends on the main question]
  - [Another sub-question that depends on the main question]
- [Second most important question]
  - [Sub-question that depends on the second question]
- [Third most important question]
- [Less critical questions that can be answered later]
```

**Question Organization Guidelines:**
- **Sort questions by importance**: Most critical questions first, least critical last
- **Use indentation for dependencies**: If question B can't be answered until question A is answered, make B a sub-question of A
- **Group related questions**: Questions that build on each other should be grouped together
- **Prioritize foundational questions**: Questions about "what" and "why" typically come before "how" and "when"

### 2. Update Individual Activity Files
For each file in the Activities/ subdirectory:

- **Keep only personal, concrete todos and action items**
- **Remove ALL generic planning questions and thinking processes**
- **PRESERVE EXACT FORMATTING**: Maintain all hashtags, references, indentation, and sub-bullet structures exactly as they appear in the original
- **Maintain specific references, links, and personal notes**
- **Use clean titles without "- Personal Todos" suffix** (being in Activities dir implies this)

**CRITICAL**: When extracting personal tasks, copy the content exactly as written, including:
- All hashtags (e.g., #Recurring, #script)
- All references and links
- Exact indentation levels for sub-tasks
- All formatting and special characters
- Checkbox states ([ ] vs [x])
- Any completion markers (@done, etc.)

**What to MOVE to Activities.md (Planning Content):**
- Questions starting with "What", "How", "Why", "When", "Where" that are generic
- Questions like "What do I do...?", "How do I...?", "What should I...?"
- Generic thinking processes and frameworks
- Planning methodologies and approaches
- Any content that applies to anyone in this role, not just personal todos

**What to KEEP in Personal Files (Personal Content):**
- Specific checkbox items with [ ] or [x]
- Personal notes and observations
- Specific references, links, and resources
- Personal ideas and thoughts
- Completed items with @done markers
- Personal preferences and decisions
- **Family and kids content** - anything mentioning family members, children, or personal relationships
  - Personal names, specific people, and personal relationships
  - Personal experiences and anecdotes
  - Personal goals and aspirations

**Structure:**
```markdown
# [Activity Name]

## Current Action Items
- [ ] [Specific todo item with exact formatting preserved]
- [ ] [Another specific todo with hashtags and indentation intact]

## Ideas to Implement
- [Personal idea or note with original formatting]

## Resources
- [Links, references, etc. with exact formatting]
```

### 2a. Consolidate Bare Activity Folders
If an activity folder contains only one or two simple files with minimal content:

- **Consolidate into a single activity file** with sections
- **Only keep folders separate** if they contain substantial, distinct content
- **Use sections within the file** to organize different aspects of the activity
- **Avoid creating huge files** - if content is substantial, keep folders separate

**Decision Criteria:**
- **Consolidate if**: Folder has 1-2 files with <50 lines total content
- **Keep separate if**: Folder has multiple substantial files or >50 lines total content
- **Use sections if**: Different aspects of same activity can be organized within one file

### 3. Update Responsibilities.md
Enhance the Responsibilities.md file to include:

- **Generic Responsibilities**: Extract generic responsibility statements from Activities.md that are generic to the role
- **Inputs**: What this role needs to function effectively
- **Outputs**: What this role produces or delivers
- **Success Metrics**: Clear criteria for measuring success in this role

**Extract Generic Responsibilities from Activities.md:**
- **Scan all planning questions** in Activities.md for generic responsibility statements
- **Look for patterns like**: "I need to...", "I must...", "I should...", "I have to...", "I ought to...", etc.
- **Extract verbatim** the exact responsibility language that is generic to the role
- **Organize by activity** to show the source of each responsibility
- **Only include generic statements** that apply to anyone in this role
- **Preserve original language** without generating new content

**Structure:**
```markdown
# Responsibilities

[Brief description of the role's purpose]

## Inputs (What this role needs)
- [Input 1]
- [Input 2]
- [etc.]

## Outputs (What this role produces)
- [Output 1]
- [Output 2]
- [etc.]

## Success Metrics (I am a good [Role Name] if...)
- [Metric 1]
- [Metric 2]
- [etc.]

## General Responsibilities (Extracted from Activities)

### From [Activity Name]
- I need to [extracted verbatim statement]
- I must [extracted verbatim statement]
- I should [extracted verbatim statement]

### From [Next Activity Name]
- I have to [extracted verbatim statement]
- I ought to [extracted verbatim statement]
- [Any other generic responsibility pattern]

[Continue for all activities with generic responsibility statements]
```

**Key Guidelines:**
- **Extract verbatim**: Use the exact responsibility language from Activities.md (I need to, I must, I should, I have to, I ought to, etc.)
- **Organize by source**: Group responsibilities by the activity they came from
- **Generic only**: Only include statements that apply to anyone in this role
- **Preserve original**: Don't generate new content, only extract existing statements
- **Show attribution**: Include "From [Activity Name]" headers to show source
- **Look for all patterns**: Scan for any generic responsibility language, not just "I need to..."
- **Place at end**: Put the "Generic Responsibilities" section at the end of the document, after Inputs, Outputs, and Success Metrics

### 4. Update Overview.md
Transform Overview.md to be a concise role description:

- **Remove repetitive planning questions** (move these to Activities.md)
- **Provide a clear role description**
- **List key focus areas**
- **Include Role Philosophy section** (extract from existing content)
- **Include Role Overlap section** (identify similar roles and differences)
- **Include Role Extension section** (if this role extends other roles)
- **Reference Activities.md for detailed planning questions**

**Structure:**
```markdown
# Overview

[Clear description of the role's purpose and scope]

## Key Focus Areas
- **[Focus Area 1]**: [Brief description]
- **[Focus Area 2]**: [Brief description]
- [etc.]

## Role Philosophy
[Extract philosophical insights, principles, or beliefs about this role from existing content]
- [Philosophy point 1]
- [Philosophy point 2]
- [etc.]

## Role Extension
[If this role extends other roles, include this section]
This role extends and enhances the following roles by [brief explanation of how this role adds value]:
- **[Extended Role 1]**: [How this role enhances or adds to the extended role]
- **[Extended Role 2]**: [How this role enhances or adds to the extended role]
- [etc.]

## Role Overlap
This role overlaps with other roles like [Role 1], [Role 2], and [Role 3], as [explanation of overlap]. However, this role is different because:
- **[Key Difference 1]**: [How this role differs from similar roles]
- **[Key Difference 2]**: [Another distinguishing characteristic]
- **[Key Difference 3]**: [Unique aspect of this role]

## Current Action Items
- [Any specific action items or questions from the original content]

*For detailed planning questions and activities, see [Activities.md](Activities.md)*
```

**Role Philosophy Guidelines:**
- **Extract from existing content**: Look for philosophical statements, principles, or beliefs about the role
- **Preserve original insights**: Keep the authentic voice and perspective from the original content
- **Focus on core beliefs**: Include statements about what the role represents or how it should be approached
- **Use bullet points**: Organize philosophical insights as clear, actionable principles

**Role Extension Guidelines:**
- **Identify extended roles**: Look for "Extends/" directories or mentions of other roles this role builds upon
- **Focus on enhancement**: Explain how this role adds value to or enhances the extended roles
- **Be succinct**: Keep descriptions brief and focused on the unique contribution
- **Avoid deep dives**: Don't elaborate extensively on the extended roles (they'll be covered individually)
- **Highlight unique aspects**: Focus on what this role specifically adds that the extended roles don't have
- **Show relationships**: Explain how this role connects to and enhances the extended roles

**Role Overlap Guidelines:**
- **Identify similar roles**: Look for mentions of other roles in the content
- **Explain the overlap**: Describe how and why roles overlap
- **Highlight differences**: Focus on what makes this role unique or distinct
- **Use specific examples**: Provide concrete examples of how this role differs from others
- **Be precise**: Avoid vague statements, be specific about distinctions

### 5. Handle Knowledge/Learning Directories
If the role contains knowledge or learning directories (e.g., "Learning Topics", "Background", etc.):

- **Rename the directory to "Knowledge"** for consistency
- **Clean up individual learning plan files** to have a clear structure
- **Preserve all original content** but reorganize for clarity

**Structure for each learning plan file:**
```markdown
# [Topic Name]

## Purpose
[Concise explanation of why this topic is important to learn for this role]

## Topics
[All the specific topics mentioned in the document, organized clearly]

## Future Topics
[Optional: Critical suggestions for additional topics to learn, one bullet point per topic]
```

**Key Guidelines:**
- **Keep all original content intact** - don't modify the actual learning content
- **Respect indentation** when reorganizing content
- **Move lines around as needed** for better organization
- **Add Purpose section** to clarify why the topic matters for the role
- **Split topics into clear sections** for better readability
- **Add Future Topics section** only if you have critical suggestions for proper learning

### 6. Handle Definition Directories
If the role contains definition directories (e.g., "Definitions", "Background", etc.):

- **Keep the directory as "Definitions"** for consistency
- **Preserve all definition content exactly as written**
- **Ensure definitions are clearly organized and accessible**

**Structure for definition files:**
```markdown
# [Definition Title]

[Keep all original content exactly as written, preserving formatting, examples, and explanations]
```

**Key Guidelines:**
- **Preserve all original content** - definitions should remain unchanged
- **Maintain exact formatting** including indentation, bullet points, and structure
- **Keep all examples and explanations** as they were originally written
- **Ensure definitions are easily findable** within the role structure

### 7. Handle References
When refactoring, preserve all references, links, and tidbits:

- **Never throw away references, links, or tidbits**
- **Keep references in their original context** when they're relevant to specific learning plans or activities
- **Create a References.md file** as a fallback to capture scattered references that don't have a clear home
- **Preserve exact formatting** of URLs, citations, and reference materials
- **Organize references by topic** or activity when possible
- **Use References.md for**: General references, scattered links, references that don't fit in specific learning plans

**Structure for References.md:**
```markdown
# References

## General References
- [Reference 1 with exact formatting]
- [Reference 2 with exact formatting]

## Scattered References
### [Activity Name]
- [Reference that doesn't fit in the activity's learning plan]

## Learning Resources
- [Books, articles, tools, etc. that don't belong to specific learning plans]
```

**Note**: References that are directly relevant to specific learning plans should remain in those learning plan files. References.md serves as a fallback for references that don't have a clear home or are scattered across multiple contexts.

### 8. Handle Mindset Directories
If the role contains mindset directories (e.g., "Mindset", "Background", etc.):

- **Keep the directory as "Mindset"** for consistency
- **Clean up individual mindset files** to have a clear structure
- **Preserve all original content** but reorganize for clarity
- **Add summary sections** explaining why each mindset characteristic is important
- **Capture mindset-nudging questions** from across the role and organize them into appropriate mindset files

**Structure for each mindset file:**
```markdown
# [Mindset Characteristic Name]

## Why This Mindset Matters
[Concise explanation of why this mindset characteristic is critical for being effective in this role]

## Mindset Content
[All the original mindset content, quotes, and motivational material organized clearly]

## Key Quotes & Motivation
[Optional: Extract and highlight key quotes or motivational content that helps establish this mindset]

## Mindset-Nudging Questions
[Questions from across the role that naturally encourage adopting this mindset - organize by source if helpful]
```

**Key Guidelines:**
- **Keep all original content intact** - don't modify the actual mindset content
- **Respect indentation** when reorganizing content
- **Move lines around as needed** for better organization
- **Add "Why This Mindset Matters" section** to clarify the importance for role effectiveness
- **Extract motivational content** into its own section if present
- **Preserve all quotes and references** exactly as written
- **Organize content logically** for better readability
- **Identify and capture mindset-nudging questions** from Activities.md, individual activity files, and other role documents
- **Organize questions by mindset characteristic** - group questions that encourage the same mindset together
- **Preserve question formatting** exactly as written when moving them to mindset files

### 9. Handle Unorganized Files (Backlogs)
When refactoring, consolidate "Unorganized" files into organized backlogs:

- **Identify all files with "Unorganized" in their title** - these are typically backlogs
- **Merge related backlogs** into consolidated backlog files under the Activities directory
- **Create separate backlog files** if topics are significantly different
- **Organize by topic sections** within each backlog file
- **Preserve all original content** with exact formatting, hashtags, and references
- **Maintain completion markers** and special formatting

**Structure for consolidated backlog files:**
```markdown
# Backlog - [Topic]

## [Topic Section 1]
- [ ] [Original content with exact formatting preserved]
- [x] [Completed items with @done markers preserved]

## [Topic Section 2]
- [ ] [Another topic's content with hashtags and indentation intact]

## References
- [Any links or references from the original files]
```

**Key Guidelines:**
- **Merge files with similar topics** into single backlog files
- **Create separate files** if topics are fundamentally different (e.g., "Business Backlog" vs "Personal Backlog")
- **Preserve all original formatting** including hashtags, completion markers, and indentation
- **Organize content by topic sections** for better navigation
- **Keep references and links** in context or in a References section
- **Use "Backlog - [Topic]" naming convention** for consistency

### 10. Handle Role Extensions
When refactoring roles that extend other roles (e.g., "The Lover" extending "The Father", "The Husband", etc.):

- **Identify extended roles** from "Extends/" directories or content mentions
- **Focus on unique contributions** this role makes to the extended roles
- **Be succinct in descriptions** - avoid deep dives into extended roles
- **Highlight enhancement value** - how this role adds to or improves the extended roles
- **Document relationships** between this role and the roles it extends

**Structure for Role Extensions in Overview.md:**
```markdown
## Role Extension
This role extends and enhances the following roles by [brief explanation of how this role adds value]:
- **[Extended Role 1]**: [How this role enhances or adds to the extended role]
- **[Extended Role 2]**: [How this role enhances or adds to the extended role]
- [etc.]
```

**Key Guidelines:**
- **Focus on enhancement**: Explain how this role adds value to or enhances the extended roles
- **Be succinct**: Keep descriptions brief and focused on the unique contribution
- **Avoid deep dives**: Don't elaborate extensively on the extended roles (they'll be covered individually)
- **Highlight unique aspects**: Focus on what this role specifically adds that the extended roles don't have
- **Show relationships**: Explain how this role connects to and enhances the extended roles

### 11. Handle Role Synonyms
When refactoring, track and preserve all role synonyms:

- **Track all role synonyms** encountered during refactoring
- **Move synonyms to Overview.md** in a dedicated section
- **If synonym is activity-specific**, mention the relevant activity in the overview
- **Preserve historical context** of role evolution and merging
- **Document role merging history** when multiple roles were combined

**Structure for Synonyms in Overview.md:**
```markdown
## Role Evolution
- **Previous Names**: [List all synonyms encountered]
- **Activity-Specific Names**: 
  - [Activity Name]: [Synonym used in this context]
- **Historical Context**: [Brief note about role merging or evolution]
```

## Key Principles

1. **Separation of Concerns**: Keep generic frameworks separate from personal action items
2. **Consolidation**: Group related questions and activities together
3. **Clarity**: Make it easy to find both planning guidance and specific todos
4. **Completeness**: Ensure all content is preserved but better organized
5. **Consistency**: Use consistent formatting and structure across all files
6. **PRESERVE FORMATTING**: Never alter the original formatting, hashtags, indentation, or special characters when extracting personal tasks
7. **PRESERVE REFERENCES**: Never throw away references, links, or tidbits - keep them in context when relevant, use References.md as fallback
8. **TRACK SYNONYMS**: Capture all role synonyms and move them to Overview.md with context
9. **CONSOLIDATE BACKLOGS**: Merge "Unorganized" files into topic-based backlog files with proper sections
10. **ORGANIZE MINDSETS**: Structure mindset content with clear importance explanations, motivational sections, and capture mindset-nudging questions from across the role
11. **CONSOLIDATE BARE FOLDERS**: Merge small activity folders into single files with sections to avoid unnecessary complexity
12. **MOVE PLANNING CONTENT**: Ensure ALL generic planning questions and thinking processes are moved to Activities.md, not left in personal files
13. **HANDLE ROLE EXTENSIONS**: For roles that extend other roles, focus on unique contributions and enhancement value while being succinct about extended roles

## Example Usage

```
Apply this refactoring to: /Users/omareid/Workspace/git/personalbook/roles/[Role Name]
```

## Final Validation Checklist

**CRITICAL**: Before completing the refactoring, perform these validation checks:

1. **File Count Verification**:
   - Count all files before and after refactoring
   - Ensure no files were accidentally deleted or missed
   - Verify all expected files were created (Activities.md, Responsibilities.md, etc.)

2. **Content Completeness Check**:
   - Use `grep` to search for remaining planning questions in individual activity files
   - Verify all planning content was moved to Activities.md
   - Check that personal todos and action items remain in individual files
   - Ensure all references and links were preserved

3. **Structure Validation**:
   - Verify all activity files have proper structure (Current Action Items, etc.)
   - Check that Activities.md contains all planning questions from individual files
   - Confirm Responsibilities.md has extracted generic responsibilities
   - Validate Overview.md includes Role Philosophy and Role Overlap sections

4. **Error Recovery**:
   - If any changes were rejected by the user, immediately investigate and fix
   - Re-read rejected files to understand current state
   - Apply correct changes based on actual file content
   - Verify fixes were applied successfully

5. **Final Quality Check**:
   - Ensure no content was lost during refactoring
   - Verify all formatting, hashtags, and indentation were preserved
   - Check that all role synonyms and historical context were documented
   - Confirm all references and links are accessible and properly organized

## Expected Outcome

After refactoring, the role directory should have:
- A comprehensive `Activities.md` with generic frameworks and planning questions
- Individual activity files containing only personal todos and specific action items
- A well-structured `Responsibilities.md` with inputs, outputs, and success metrics
- A concise `Overview.md` that provides role context, role evolution, role extensions (if applicable), and references the detailed activities
- A `Knowledge/` directory (if applicable) with well-organized learning plans
- A `Definitions/` directory (if applicable) with key role definitions preserved exactly
- A `Mindset/` directory (if applicable) with well-organized mindset characteristics and motivational content
- A `References.md` file (if applicable) with all scattered references and links preserved
- Consolidated backlog files (if applicable) with topic-based sections for "Unorganized" content
- Role evolution, synonyms, and extensions documented in Overview.md

This structure makes it easy to:
- Understand the role's scope and requirements
- Find planning guidance for any activity
- Track personal progress and todos
- Measure success in the role
- Access organized learning resources and knowledge areas
- Reference key definitions and terminology for the role
- Access mindset guidance and motivational content for role effectiveness
- Access all relevant references and links
- Understand role evolution and historical context
- Navigate consolidated backlogs by topic for better organization
