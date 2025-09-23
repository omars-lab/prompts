# AI Metadata Injection Prompt

## Purpose
This prompt helps inject comprehensive AI metadata sections into blog posts to make them self-healing and automatically updatable by AI agents.

## Instructions

You are an expert technical writer and AI systems architect. Your task is to inject a comprehensive AI metadata section into a blog post that will enable AI agents to automatically update the content based on changes in the underlying system or data.

### Context
The blog post is located in a Docusaurus documentation site and contains information about AI prompts, workflows, or technical systems. The metadata should be hidden from human readers but provide clear instructions for AI agents on how to maintain and update the content.

### Requirements

1. **Analyze the blog post content** to understand:
   - What system, workflow, or data it describes
   - What elements might change over time (file paths, version numbers, statistics, etc.)
   - What external dependencies or references exist
   - What patterns or structures should be maintained

2. **Create a comprehensive AI metadata section** that includes:

   **A. Update Instructions:**
   - Clear step-by-step instructions for AI agents
   - Specific patterns to look for when scanning for changes
   - How to extract and update dynamic content
   - File paths and directory structures to monitor

   **B. Content Patterns:**
   - Regex patterns for identifying updatable content
   - Templates for consistent formatting
   - Rules for maintaining structure and style

   **C. Data Sources:**
   - What files or directories to scan for changes
   - How to extract relevant information
   - Dependencies and relationships to track

   **D. Update Triggers:**
   - When the content should be updated
   - What changes should trigger an update
   - How to detect if an update is needed

   **E. Iteration History:**
   - Document significant changes and improvements made to the content
   - Include dates and descriptions of major iterations
   - Track evolution of the document structure and approach
   - Note key decisions and rationale for future reference
   - **Summarize all contributions that happen on the same day** into a single comprehensive entry
   - Use descriptive titles for daily summaries (e.g., "Complete feature implementation and optimization")

   **F. Evaluation Criteria (For Content Quality Assessment):**
   - Define specific criteria for evaluating content quality and completeness
   - Include metrics for measuring success (e.g., comprehensiveness, accuracy, usability)
   - Establish standards for content structure and formatting
   - Set benchmarks for user experience and navigation
   - Define criteria for technical depth and business relevance (where applicable)

   **G. Content Feedback Loop (For Continuous Improvement):**
   - Establish process for evaluating content against defined criteria
   - Identify gaps in coverage or quality issues
   - Prioritize improvements based on impact and user needs
   - Ensure consistency with existing format and quality standards
   - Update evaluation criteria based on new insights and feedback
   - Document rationale for content placement and prioritization decisions

3. **Format the metadata section** as a collapsible section:
   ```html
   <details>
   <summary>🤖 AI Metadata (Click to expand)</summary>
   
   ```yaml
   # AI METADATA - DO NOT REMOVE OR MODIFY
   [Comprehensive instructions here]
   ```
   
   </details>
   ```

4. **Place the metadata** at the end of the blog post, just before any closing elements

### Metadata Section Template

```html
<details>
<summary>🤖 AI Metadata (Click to expand)</summary>

```yaml
# AI METADATA - DO NOT REMOVE OR MODIFY
# AI_UPDATE_INSTRUCTIONS:
# This document should be automatically updated when [specific conditions]. 
# Follow these steps:
#
# 1. SCAN_SOURCES: [What to scan and where]
# 2. EXTRACT_DATA: [What data to extract and how]
# 3. UPDATE_CONTENT: [How to update the content]
# 4. VERIFY_CHANGES: [How to verify updates are correct]
# 5. MAINTAIN_FORMAT: [How to preserve formatting and structure]
#
# CONTENT_PATTERNS:
# - [Pattern 1]: [Description and regex if applicable]
# - [Pattern 2]: [Description and regex if applicable]
# - [Pattern 3]: [Description and regex if applicable]
#
# DATA_SOURCES:
# - [Source 1]: [Path and description]
# - [Source 2]: [Path and description]
# - [Source 3]: [Path and description]
#
# UPDATE_TRIGGERS:
# - [Trigger 1]: [When this should trigger an update]
# - [Trigger 2]: [When this should trigger an update]
# - [Trigger 3]: [When this should trigger an update]
#
# FORMATTING_RULES:
# - [Rule 1]: [How to maintain consistent formatting]
# - [Rule 2]: [How to maintain consistent formatting]
# - [Rule 3]: [How to maintain consistent formatting]
#
# ITERATION_HISTORY:
# - [Date]: [Descriptive title] - [Comprehensive summary of all changes made on this date]
# - [Date]: [Descriptive title] - [Comprehensive summary of all changes made on this date]
# - [Date]: [Descriptive title] - [Comprehensive summary of all changes made on this date]
#
# EVALUATION_CRITERIA (For Content Quality Assessment):
# 1. [CRITERIA_NAME]: [Description of what to evaluate and how to measure it]
# 2. [CRITERIA_NAME]: [Description of what to evaluate and how to measure it]
# 3. [CRITERIA_NAME]: [Description of what to evaluate and how to measure it]
# [Add more criteria as needed for the specific content type]
#
# CONTENT_FEEDBACK_LOOP (For Continuous Improvement):
# - Evaluate content against all defined criteria before making major edits
# - Identify gaps in coverage or quality issues
# - Prioritize improvements based on impact and user needs
# - Ensure new content maintains consistency with existing format and quality standards
# - Update evaluation criteria based on new insights and user feedback
# - Document rationale for content placement and prioritization decisions
#
# UPDATE_FREQUENCY: [How often this should be checked/updated]
```

</details>
```

### Examples of Dynamic Content to Track

- **File counts and statistics**: "15 files", "3,037 insertions"
- **Time savings calculations**: "25-40 hours per year", "$1,875-$3,000 in annual value"
- **Version numbers**: "v2.1.3", "latest"
- **File paths**: Directory structures, file locations
- **Dependencies**: Package versions, tool versions
- **Configuration**: Settings, parameters, options
- **Lists and inventories**: File lists, feature lists, capability lists

### Quality Checklist

Before finalizing the metadata section, ensure:

- [ ] Instructions are specific and actionable
- [ ] Patterns are clearly defined with examples
- [ ] Data sources are accurately specified
- [ ] Update triggers are well-defined
- [ ] Formatting rules preserve document structure
- [ ] Metadata is hidden from human readers (collapsed by default)
- [ ] Instructions are comprehensive enough for AI agents
- [ ] Examples are provided where helpful
- [ ] Evaluation criteria are defined for content quality assessment
- [ ] Content feedback loop process is established for continuous improvement

### Evaluation Criteria Usage Guidelines

**Always include evaluation criteria when:**
- Creating content that will be iteratively improved (story banks, interview prep)
- Building documents with specific quality standards (technical documentation, portfolios)
- Developing content with multiple stakeholders or use cases
- Creating resources that need to maintain consistency over time

**Use the content feedback loop when:**
- Making major edits to existing content
- Adding new sections or restructuring documents
- Updating content based on user feedback or new requirements
- Ensuring content meets established quality standards

**Evaluation criteria should include:**
- Comprehensiveness and coverage metrics
- Quality standards and formatting requirements
- User experience and navigation benchmarks
- Technical depth and business relevance measures (where applicable)
- Consistency and alignment with established patterns

### Output

Provide the complete AI metadata section that should be injected into the blog post, formatted as a collapsible section and ready to be inserted at the end of the document.

## Example Usage

**Input**: A blog post about a collection of AI prompts with use case diagrams and statistics

**Output**: AI metadata section that instructs AI agents to:
- Scan the prompts directory for new files
- Extract time savings and ROI data from each prompt
- Update the use case diagram with new nodes
- Recalculate total statistics
- Maintain consistent formatting and structure

The metadata should be comprehensive enough that an AI agent could use it to automatically keep the blog post current as the underlying system evolves.
