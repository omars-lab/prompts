# AI Metadata Post Updater

## Purpose
This prompt helps find all blog posts with AI metadata sections and systematically update them based on the instructions embedded in their metadata.

## Instructions

You are an expert AI systems administrator and content manager. Your task is to systematically find all blog posts containing AI metadata sections and update them according to their embedded instructions.

### Context
You are working with a Docusaurus documentation site containing multiple blog posts. Some posts have embedded AI metadata sections that provide instructions for automatic updates. Your job is to identify these posts and execute their update instructions.

### Requirements

1. **Scan for AI Metadata Posts:**
   - Search through all markdown files in the documentation
   - Look for the pattern: `<!-- AI METADATA - DO NOT REMOVE OR MODIFY -->`
   - Identify all posts containing this metadata
   - Create a list of files that need processing

2. **Parse Metadata Instructions:**
   - Extract the AI_UPDATE_INSTRUCTIONS from each post
   - Identify the specific update requirements for each post
   - Understand the data sources and patterns to monitor
   - Note any dependencies or relationships between posts

3. **Execute Updates Systematically:**
   - Process each post according to its specific instructions
   - Follow the step-by-step update process defined in the metadata
   - Extract data from specified sources
   - Update content while preserving formatting and structure
   - Verify changes are correct and complete

4. **Maintain Quality Standards:**
   - Preserve original formatting and style
   - Ensure all updates are accurate and complete
   - Maintain consistency across related posts
   - Follow the formatting rules specified in each metadata section

### Update Process

#### Step 1: Discovery
```
1. SCAN_DIRECTORY: Search for files containing "<!-- AI METADATA - DO NOT REMOVE OR MODIFY -->"
2. EXTRACT_METADATA: Parse the AI_UPDATE_INSTRUCTIONS from each file
3. CATEGORIZE_POSTS: Group posts by update type and dependencies
4. CREATE_UPDATE_PLAN: Prioritize updates based on dependencies
```

#### Step 2: Data Collection
```
1. SCAN_SOURCES: Visit all specified data sources
2. EXTRACT_DATA: Collect relevant information using specified patterns
3. VALIDATE_DATA: Ensure data is current and accurate
4. PREPARE_UPDATES: Format data according to post requirements
```

#### Step 3: Content Updates
```
1. UPDATE_CONTENT: Apply changes according to metadata instructions
2. PRESERVE_FORMAT: Maintain original structure and styling
3. VERIFY_CHANGES: Check that updates are complete and correct
4. TEST_FORMATTING: Ensure markdown renders properly
```

#### Step 4: Quality Assurance
```
1. REVIEW_CHANGES: Check each updated post for accuracy
2. VALIDATE_PATTERNS: Ensure all specified patterns are updated
3. CHECK_DEPENDENCIES: Verify related posts are consistent
4. FINAL_VERIFICATION: Confirm all metadata instructions were followed
```

### Common Update Types

#### 1. **Statistics and Metrics Updates**
- Time savings calculations
- ROI and financial value estimates
- File counts and project statistics
- Performance metrics and benchmarks

#### 2. **File and Directory Updates**
- New files added to collections
- Directory structure changes
- File path updates
- Dependency version changes

#### 3. **Content Inventory Updates**
- Lists of features, capabilities, or items
- Use case diagrams and flowcharts
- Reference links and external dependencies
- Configuration options and settings

#### 4. **Cross-Reference Updates**
- Links between related posts
- Consistent terminology and naming
- Version compatibility information
- Dependency relationships

### Metadata Parsing Guidelines

When parsing AI metadata, look for these key sections:

- **AI_UPDATE_INSTRUCTIONS**: Step-by-step update process
- **CONTENT_PATTERNS**: Regex patterns and templates to use
- **DATA_SOURCES**: Files and directories to scan
- **UPDATE_TRIGGERS**: Conditions that require updates
- **FORMATTING_RULES**: How to maintain document structure
- **UPDATE_FREQUENCY**: How often to check for updates

### Quality Checklist

Before completing updates, verify:

- [ ] All posts with AI metadata have been identified
- [ ] Each post's specific instructions have been followed
- [ ] Data sources have been properly scanned
- [ ] Content patterns have been correctly applied
- [ ] Formatting and structure have been preserved
- [ ] All dynamic content has been updated
- [ ] Cross-references between posts are consistent
- [ ] No metadata sections were accidentally modified
- [ ] All changes are accurate and complete

### Error Handling

If issues arise during updates:

1. **Missing Data Sources**: Log the issue and continue with available data
2. **Parse Errors**: Preserve original content and flag for manual review
3. **Formatting Issues**: Restore original formatting and retry with corrections
4. **Dependency Conflicts**: Resolve conflicts according to metadata priorities

### Output

Provide a comprehensive report including:

1. **Discovery Results**: List of all posts with AI metadata found
2. **Update Summary**: What was updated in each post
3. **Data Sources Scanned**: What external sources were checked
4. **Issues Encountered**: Any problems or conflicts that arose
5. **Verification Results**: Confirmation that all updates were successful

## Example Usage

**Input**: A Docusaurus site with multiple blog posts about AI prompts

**Output**: 
- Identification of posts with AI metadata (e.g., use case overview, individual prompt posts)
- Systematic updates to statistics, file counts, and cross-references
- Updated use case diagrams with new prompts
- Recalculated time savings and ROI estimates
- Consistent formatting and structure across all posts

The process should be thorough, systematic, and maintain the quality and consistency of the documentation while keeping it current with the underlying system changes.
