# Prompt: Daily Todo Carry Over
You are tasked with carrying over incomplete tasks from my daily notes and shifting them forward to appropriate future dates.

## Task Handling Rules
Follow the guidelines in: `rules/task-handling-rules.md`

## Meeting Notes Organization
**CRITICAL**: Before carrying over tasks, extract meeting notes into individual files following the organize-work-tasks.md guidance:
- **Extract meeting sections**: Identify meeting notes (e.g., "## Meeting Notes - [Name]", "## [Project] Meeting", etc.)
- **Create individual meeting files**: Use the `🏢📝 Work Meeting Notes.txt` template format
- **Template formatting**: When following the template, convert two dashes (`--`) to three dashes (`---`) for proper YAML frontmatter in the final output
- **File location**: Place in appropriate workstream directory (e.g., `🏢 Amazon/🏢👥 Meetings/2025 🚚 SDS/`)
- **Naming convention**: `🏢 YYMMDD [Meeting Title].txt`
- **Replace with summary todos**: In the daily file, replace meeting sections with:
  - `* [x] Attended [Meeting Name] meeting (notes: [[🏢 YYMMDD [Meeting Title]]]) @done(YYYY-MM-DD HH:MM PM)`
  - `* [ ] Action items from [[🏢 YYMMDD [Meeting Title]]]`
    - `* [ ] [Action Item 1] >[source-date]`
    - `* [ ] [Action Item 2] >[source-date]`
    - `* [ ] [Action Item 3] >[source-date]`

## Organization Strategy

### Daily File Header Requirements
**CRITICAL**: Ensure all daily files touched by the prompt have proper headers:
- **Date Header**: `# YYYY-MM-DD DayOfWeek` (e.g., `# 2025-09-16 Monday`)
- **Editing Links**: For files with tasks, add after date header:
  ```
  * Edit Noteplan from [Work](vscode://file/Users/oeid/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application%20Support/co.noteplan.NotePlan3) or [Personal](cursor://file/Users/omareid/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application%20Support/co.noteplan.NotePlan3) machine
  ```
- **Empty Files**: Files without tasks/notes should not have editing links
- **Username Handling**: Use appropriate username (`oeid` for work, `omareid` for personal) based on current working directory

### Task Structure Preservation
- **Move as hierarchical units**: Tasks with subtasks must be moved as cohesive chunks, preserving parent-child relationships and indentation
- **Maintain task hierarchy**: Never break apart task structures - if a parent moves, all its incomplete subtasks move together
- **Preserve indentation levels**: Subtask nesting and spacing must remain intact during moves
- **EXCLUDE meeting notes**: Never carry over content from meeting sections - these remain completely untouched in original files

### Completion Status Handling
- **Completed tasks stay put**: All completed tasks (`* [x]`) remain in their original files and sections
- **Incomplete tasks move completely**: All incomplete tasks (`* [ ]`) are moved to destination files as tasks (`* [ ]`) - NOT converted to bullet points
- **Remove from original**: Incomplete tasks are completely removed from original files, not marked as done
- **Mixed completion logic**: For parent tasks with both completed and incomplete subtasks:
  - Convert parent to regular bullet point (`*`) in original file to preserve completed subtask context
  - Move parent as incomplete task (`* [ ]`) to destination with only incomplete subtasks
  - This avoids duplicate todos while maintaining completion history
- **Fully completed tasks**: Keep as completed markdown tasks (`* [x]`) in original file
- **Context preservation**: Non-actionable context items (like "Word has copilot baked in...") should be converted to bullet points (`*`) and preserved in hierarchy
- **Never convert actionable tasks to bullet points**: Only move incomplete tasks as tasks, never convert them to bullet points unless they're truly non-actionable context
- **Proper markdown format**: Use `* [x]` for completed tasks with `@done(YYYY-MM-DD HH:MM PM)` annotations, never use emoji checkmarks (✅)
- **Clean source files**: Do NOT add "carried over" messages to source files - keep them clean for productivity analysis
- **No fake meeting records**: Only create meeting attendance records if there are actual meeting note files - never assume action items represent meetings
- **Complete removal**: Incomplete tasks are completely removed from source files, not converted to new action items or fake meetings
- **Carry-over tracking**: In destination files, add date tags (`>YYYY-MM-DD`) referencing the original source date

### Date Tag Management
- **Auto-add missing dates**: Tasks without date tags get `>YYYY-MM-DD` based on source file date before moving
- **Preserve existing dates**: Tasks with existing date tags keep them during moves
- **Date format**: Use `>YYYY-MM-DD` or `>today` format (no curly braces)
- **Carry over tracking**: Look at the oldest date tag on tasks and append `[X weeks]` to indicate how long the task has been carried over
- **Chronological processing**: Since processing starts from oldest date, carry-over tracking will be accurate as tasks move forward day by day
- **Date tag scope**: ONLY add date tags to parent-level (un-indented) actionable tasks
- **No date tags on subtasks**: Subtasks and context items should NOT receive date tags
- **No date tags on context**: Non-actionable context items (like "Word has copilot baked in...") should never get date tags

### Output Organization
- **Primary partition**: Work (🏢) vs Personal (🏡) tasks
- **Secondary grouping**: Theme/workstream sections within each partition
- **Avoid carry over sections**: Don't structure by "Carried Over Tasks" - integrate into natural workflow themes
- **Clean task format**: Tasks should only have date tags (`>YYYY-MM-DD`) and carry over indicators (`[X weeks]`) added

## Additional Rules for Daily Notes
- **Add date tags**: If a task lacks a date tag (`>YYYY-MM-DD`), add one based on the source file date before moving
- **Move only incomplete tasks**: Only move incomplete tasks (`* [ ]`) - leave completed tasks (`* [x]`) in their original files
- **Preserve completed work**: Completed tasks and their subtasks stay in the same header section of the original file
- **Filter task chunks**: When moving task hierarchies, exclude any completed parent/child tasks from the move
- **Context preservation**: For parent tasks with mixed completion status that get carried over, convert the parent to a regular bullet point in the original file to preserve completed subtask context without duplicating the todo

## Input Directory
Analyze daily note files from the last 2 weeks in: `/Users/oeid/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Calendar`

## Processing Order
**CRITICAL**: Process files in chronological order from oldest to newest date within the 2-week window:
1. Start with the oldest date (14 days ago) - this defines the starting range of files to process
2. Process each day sequentially 
3. **AWAIT CONFIRMATION** after each day's carry-over before proceeding to the next day
4. End with the most recent date (yesterday)
5. This ensures proper carry-over tracking and prevents tasks from being moved multiple times
6. **User approval required**: Present the carry-over results for each day and wait for explicit confirmation before moving to the next day
7. **Note**: The 2-week window only defines which source files to process - carry-over destinations can be any future date

## Daily Processing Workflow
For each day in the 2-week window, follow this exact sequence:
1. **Content Organization**: Organize scattered content into logical sections by workstream/project
2. **Meeting Notes Extraction**: Extract meeting notes into individual files using proper template format
3. **Task Identification**: Identify incomplete tasks to carry over
4. **Pre-Processing Validation**: Run pre-processing validation checks
5. **Carry-Over Planning**: Present proposed destinations and await user confirmation
6. **Execution**: Execute carry-over with proper markdown formatting
7. **Pre-Removal Validation**: Validate carry-over success before removing source content
8. **Source Cleanup**: Remove carried-over content from source files only after validation
9. **Post-Processing Validation**: Run post-processing validation checks
10. **Completion**: Mark day as processed and move to next day

## Analysis Tasks

### 1. Content Organization (Pre-Carry-Over)
**CRITICAL**: Before attempting carry-over, organize scattered content into logical sections:
- **Group related content**: Consolidate notes, action items, references, and context into coherent project sections
- **Identify workstreams**: Organize content by workstream (SDS, QC, GenAI, etc.) and project themes
- **Separate meeting content**: Extract meeting notes into individual files before organizing other content
- **Preserve context**: Keep related references, links, and notes with their associated tasks
- **Create logical structure**: Organize content into clear sections with appropriate headers
- **Organize references**: Convert all reference sections into actionable tasks under "Move reference to the right place"

### 2. Task Collection (Day-by-Day Processing)
For each day in chronological order:
- Scan daily notes for incomplete tasks (`* [ ]`) - ignore daily notes/journal entries
- **EXCLUDE meeting notes**: Do not carry over any content from meeting sections (e.g., "## Meeting Notes", "## Meeting with [Name]", "## Team Meeting", etc.)
- **Preserve meeting sections**: Keep all meeting notes intact in their original files and sections
- Identify tasks with existing scheduled dates (`>YYYY-MM-DD`)
- Find overdue tasks from past dates
- Collect both work and personal tasks
- **Process one day completely before moving to the next day**
- **Present results and await user confirmation before proceeding to the next day**

### 2. Reference Organization
**CRITICAL**: Convert all reference sections into actionable carry-over tasks:
- **Identify reference sections**: Look for sections like "## References", "**References:**", "**Search Queries:**", "**Links:**", etc.
- **Create reference tasks**: Convert each reference section into: `* [ ] Move reference to the right place >[source-date]`
- **Make references subtasks**: Indent all URLs, links, and references as subtasks under the main reference task
- **Preserve all links**: Include all URLs, search queries, and reference materials as indented bullet points
- **Apply date tags**: Add proper date tags (`>[source-date]`) to reference tasks for carry-over tracking
- **Remove from source**: After organizing, remove reference sections from source files (they become carry-over tasks)

### 3. Meeting Notes Identification & Exclusion
**CRITICAL**: Identify and exclude meeting-related content:
- **Meeting section headers**: Look for headers like "## Meeting Notes", "## Meeting with [Name]", "## Team Meeting", "## 1:1 with [Name]", "## Standup", "## Retrospective"
- **Meeting content**: Any content under meeting headers (tasks, notes, action items) should NOT be carried over
- **Preserve meeting sections**: Keep all meeting content intact in original files
- **Meeting action items**: Even if they appear as tasks (`* [ ]`), do not move them if they're within meeting sections
- **Meeting note files**: Only create meeting attendance records if actual meeting note files exist (e.g., `[[🏢 YYMMDD Meeting Title]]`)
- **No assumptions**: Never assume carried-over action items represent meetings - only create meeting records for actual meetings with note files

### 4. Task Separation & Emoji Mapping
**CRITICAL**: Use the user's established emoji system for proper categorization and grouping:

#### 🏢 Work Task Categories & Emojis:
- **🚚 SDS**: SDS-related tasks, driver feedback, integrations, data analysis
- **🛒 QC**: Quick Commerce tasks, guided workflows, customer experience
- **🧪 Weblab**: Experimentation, A/B testing, weblab guidance, analysis
- **🤖 GenAI**: AI/ML development, MCP servers, prompt engineering, Q CLI
- **📊 FSD**: Data platform guidance, metrics, analytics
- **⚙️ SDLC**: Development processes, SOPs, technical procedures
- **🌱 Growth**: Career development, 1:1s, skill building
- **👨🏻‍🏫 Mentorship**: Teaching, guidance, knowledge sharing
- **🗑️ Other**: General work tasks, backlogs, miscellaneous

#### 🏡 Personal Task Categories & Emojis:
- **💰 Assets**: Finances, investments, budgeting, subscriptions, big purchases
- **🧑‍🧑‍🧒‍🧒 Family**: Family activities, relationships, parenting, celebrations
- **✈️ Traveling**: Trip planning, travel arrangements, vacation prep
- **🎉 Celebrating**: Birthdays, anniversaries, special events
- **🎒 Activities**: Entertainment, outings, recreational activities
- **🏠 Home**: Home maintenance, repairs, household tasks
- **👨🏻‍🔧 Fixing**: Repairs, troubleshooting, technical fixes
- **💊 Health**: Medical, wellness, health habits
- **📑 Paperwork**: Taxes, insurance, legal documents, renewals
- **👨🏻‍💻 Developing**: Personal coding projects, technical learning
- **👨🏻‍💼 Entrepreneurship**: Business ideas, side projects, startups
- **🛒 Shopping**: Purchases, buying decisions, product research
- **🧎🏻 Spirituality**: Religious practices, spiritual development
- **🧠 Brainstorming**: Idea generation, creative thinking
- **🪞 Reflecting**: Self-reflection, purpose, personal growth
- **⚖️ Deciding**: Important decisions, choices, evaluations
- **⚙️ Automating**: Process automation, efficiency improvements

### Emoji System Source & Username Handling
**CRITICAL**: The emoji system is derived from the user's established Plans directories:
- **Source Directories**: 
  - Work: `🏢 Amazon/🏢📆 Plans` (contains 🚚 SDS, 🛒 QC, 🧪 Weblab, 🤖 GenAI, etc.)
  - Personal: `🏡 Personal/🏡📆 Plans` (contains 💰 Assets, 🧑‍🧑‍🧒‍🧒 Family, ✈️ Traveling, etc.)
- **Username Variations**: Handle both `oeid` and `omareid` usernames:
  - `/Users/oeid/Library/Containers/...` (work machine)
  - `/Users/omareid/Library/Containers/...` (personal machine)
- **Self-Healing**: If emoji mapping issues arise, scan these directories to understand the user's actual emoji usage patterns
- **Username Detection**: Use the current working directory or environment to determine the correct username:
  - If path contains `/Users/oeid/`, use `oeid`
  - If path contains `/Users/omareid/`, use `omareid`
  - Default to checking both paths if uncertain

### 5. Task Assessment & Categorization
Categorize tasks using the established emoji system:
- **Work categorization**: Use work emojis (🚚 SDS, 🛒 QC, 🧪 Weblab, 🤖 GenAI, etc.) based on task content
- **Personal categorization**: Use personal emojis (💰 Assets, 🧑‍🧑‍🧒‍🧒 Family, ✈️ Traveling, etc.) based on task content
- **Grouping logic**: Group related tasks under the same emoji category for better organization
- **Date status**: Note existing scheduled dates (`>YYYY-MM-DD`) and tasks needing date assignment
- **Task patterns**: Identify recurring tasks and overdue items across emoji categories

### 6. Forward Scheduling (Business Day Logic)
For incomplete tasks from the 2-week source window:
- **🏢 Work Tasks**: Carry over to the next business day (Monday-Friday)
  - **CRITICAL**: Use timezone-aware date calculation to determine next business day
  - If today is Friday, carry over to next Monday
  - If today is weekend, carry over to next Monday  
  - If today is Monday-Thursday, carry over to next day
  - **Validation**: Always verify the calculated next business day is correct using date commands
- **🏡 Personal Tasks**: Carry over to the upcoming Saturday
  - All personal tasks go to the next Saturday regardless of current day
  - **CRITICAL**: Use timezone-aware date calculation to find the correct Saturday
  - This consolidates personal tasks for weekend processing
- **Priority by age**: Tasks from older dates in the 2-week source window get higher priority for immediate scheduling
- **Destination flexibility**: Carry-over destinations can be any future date, not limited to the 2-week window

### Business Day Calculation Procedures
**CRITICAL**: Always use timezone-aware date calculation to determine next business day:
1. **Identify source date**: Determine the day of the week for the source file date
2. **Calculate next business day (for work tasks)**: 
   - Friday → Next Monday
   - Saturday/Sunday → Next Monday
   - Monday → Tuesday
   - Tuesday → Wednesday
   - Wednesday → Thursday
   - Thursday → Friday
3. **Calculate upcoming Saturday (for personal tasks)**:
   - Any day → Next Saturday (regardless of current day)
   - Use date commands to find the next Saturday from the source date
4. **Validate calculation**: Use date commands to verify the calculated next business day/Saturday
5. **Timezone awareness**: Ensure calculations respect the user's current timezone
6. **Cross-reference**: Double-check that the calculated date is actually the correct destination day

### Emoji Mapping Self-Healing Procedures
**CRITICAL**: If emoji mapping concerns are raised, follow these self-healing steps:
1. **Reference Established System**: Use the documented emoji categories from this prompt
2. **Scan Reference Directories**: If needed, scan the user's Plans directories to understand emoji usage patterns:
   - **Determine Username**: Check current working directory to identify username:
     - If path contains `/Users/oeid/`, use `oeid`
     - If path contains `/Users/omareid/`, use `omareid`
     - If uncertain, try both usernames
   - **Work Plans Path**: `/Users/[USERNAME]/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Notes/🏢 Amazon/🏢📆 Plans`
   - **Personal Plans Path**: `/Users/[USERNAME]/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Notes/🏡 Personal/🏡📆 Plans`
   - **Scan Both Directories**: List contents to understand emoji usage patterns and folder structure
3. **Analyze Task Content**: Determine the correct emoji based on task content and context
4. **Apply Correct Categorization**: Re-categorize tasks using the appropriate emoji
5. **Group Related Tasks**: Consolidate tasks under the same emoji category for better organization
6. **Validate Consistency**: Ensure all similar tasks use the same emoji category
7. **Update Organization**: Reorganize destination files with proper emoji-based grouping

## Validation & Integrity Checks
**CRITICAL**: Before and after each day's carry-over, perform these validation steps:

### Pre-Processing Validation
1. **Content Inventory**: Count and list all tasks in the source file before any changes
2. **Task Classification**: Categorize each task as completed (`* [x]`), incomplete (`* [ ]`), or regular bullet (`*`)
3. **Meeting Notes Identification**: Identify and mark all meeting sections for exclusion from carry-over
4. **Hierarchy Mapping**: Document parent-child relationships and indentation levels
5. **Date Tag Audit**: Record existing date tags and their values
6. **Business Day Validation**: Verify calculated next business day using timezone-aware date commands
7. **Emoji Mapping Validation**: Ensure tasks are categorized using the correct emoji system

### Pre-Removal Validation
**CRITICAL**: Before removing any content from source files, validate that carry-over was successful:
1. **Destination File Verification**: Confirm all tasks were successfully added to destination files
2. **Content Match Check**: Verify that all source content appears in destination files with proper formatting
3. **Date Tag Transfer**: Confirm all date tags were properly transferred to destination files
4. **Hierarchy Preservation**: Verify parent-child relationships and indentation are maintained in destination
5. **Reference Organization**: Confirm all reference sections were converted to "Move reference to the right place" tasks
6. **Meeting Notes Extraction**: Verify meeting notes were extracted to individual files and summary todos created
7. **No Missing Content**: Ensure no tasks, references, or content were lost during carry-over
8. **User Confirmation**: Present validation report and await explicit user approval before removing source content

### Post-Processing Validation
1. **Content Preservation Check**: Verify all original content remains in source file (completed tasks, journal entries, non-task content)
2. **Meeting Notes Preservation**: Confirm all meeting sections remain completely untouched in original files
3. **Task Count Verification**: Ensure total task count matches (completed tasks stay + incomplete tasks moved = original total)
4. **Hierarchy Integrity**: Confirm parent-child relationships are preserved in destination files
5. **Date Tag Consistency**: Verify date tags are properly transferred and formatted
6. **No Duplication**: Check that tasks aren't duplicated between source and destination
7. **No Loss**: Confirm no tasks or content disappeared during the process
8. **Source Cleanup Verification**: Confirm only appropriate content was removed from source files

### Pre-Removal Validation Report Format
```
PRE-REMOVAL VALIDATION REPORT for [DATE]:
✓ Destination file verification: [X] tasks successfully added to [DESTINATION_FILE]
✓ Content match check: All source content appears in destination with proper formatting
✓ Date tag transfer: [X] date tags properly transferred to destination
✓ Hierarchy preservation: Parent-child relationships maintained in destination
✓ Reference organization: [X] reference sections converted to "Move reference to the right place" tasks
✓ Meeting notes extraction: [X] meeting notes extracted to individual files
✓ No missing content: All tasks, references, and content successfully carried over
✓ User confirmation: Awaiting explicit approval to remove source content

READY TO REMOVE SOURCE CONTENT: [YES/NO]
```

### Validation Report Format
```
VALIDATION REPORT for [DATE]:
✓ Source file content preserved: [X] completed tasks remain
✓ Meeting notes preserved: [X] meeting sections remain untouched
✓ Tasks moved: [X] incomplete tasks → [destination files]
✓ Total task count: [X] (matches original)
✓ Hierarchy preserved: [X] parent-child relationships maintained
✓ Date tags transferred: [X] tags properly formatted
✓ No duplication detected
✓ No content loss detected
```

## Confirmation Process
**CONDITIONAL**: After processing each day's carry-over:
1. **Check for changes needed**: If no incomplete tasks found, skip confirmation and proceed to next day
2. **Present the day's results**: Show all tasks being carried over from that specific date (only if changes needed) - no "carried over" messages will be added to source files
3. **Display proposed destinations**: Show where each task will be moved and when
4. **Show validation report**: Present the validation results for user review
5. **Wait for explicit confirmation**: Do not proceed to the next day until user approves (only if changes needed)
6. **Handle modifications**: If user requests changes, implement them before moving forward
7. **Re-validate after changes**: Run validation again if modifications are made
8. **Confirm completion**: Only after user approval and successful validation, mark that day as processed and move to the next

## Task Integration & Theme Merging
**CRITICAL**: When carrying over tasks to existing files:
1. **Read destination file first**: Always check existing content before adding tasks
2. **Identify existing themes**: Look for existing theme headers (e.g., "### 🔥 Client Relations", "### 📅 Personal Finance")
3. **Merge into existing themes**: If a theme already exists, add tasks to that section instead of creating duplicates
4. **Create new themes only when needed**: Only create new theme headers if no suitable existing theme exists
5. **Preserve existing structure**: Maintain the existing file's organization and formatting
6. **Respect existing content**: Never overwrite or modify existing tasks, only add new ones

### Theme Matching Logic
- **Work themes**: Match by workstream (Client Relations, Project Management, Administrative, Team Collaboration)
- **Personal themes**: Match by life area (Health & Wellness, Home & Family, Finance, Travel & Recreation, Personal Growth)
- **Priority levels**: Match by urgency (🔥 Urgent, 📅 Standard, 📋 Lower Priority)

### Hierarchy & Context Preservation Rules
- **Preserve task hierarchy**: Maintain parent-child relationships and indentation levels exactly
- **Context items stay as bullet points**: Non-actionable context (like URLs, notes, explanations) should be preserved as bullet points (`*`) in their proper hierarchical position
- **Actionable items stay as tasks**: Only truly actionable items should be moved as tasks (`* [ ]`)
- **Mixed content handling**: When a parent task has both actionable subtasks and context items:
  - Move actionable subtasks as tasks (`* [ ]`) to destination
  - Keep context items as bullet points (`*`) in their proper position
  - Preserve the hierarchical relationship between them

## Common Mistakes to Avoid
**CRITICAL**: Learn from previous cleanup experiences to avoid these mistakes:

### ❌ What NOT to Do:
1. **Don't create fake meeting records**: Never assume carried-over action items represent meetings
2. **Don't add "carried over" messages**: Source files should be clean with no carry-over references
3. **Don't convert tasks to placeholder todos**: Incomplete tasks should be completely removed from source files, not converted to placeholder todos like "Action items from [Project]"
4. **Don't assume meetings exist**: Only create meeting attendance records if actual meeting note files exist
5. **Don't leave empty files**: Remove files that have no content after cleanup
6. **Don't create duplicate work**: Don't add action item todos if they've already been carried over

### ✅ What TO Do:
1. **Complete removal**: Incomplete tasks are completely removed from source files
2. **Clean source files**: Only completed work and meeting records remain in source files
3. **Verify meeting files**: Only create meeting records for actual meetings with note files
4. **Proper headers**: Add date headers and editing links to files with tasks
5. **Empty file cleanup**: Remove files with no meaningful content
6. **Check destinations**: Verify action items haven't already been carried over before adding new ones

## Error Handling & Rollback Procedures
**CRITICAL**: If validation fails or content loss is detected:

### Pre-Removal Validation Failure Response
**CRITICAL**: If pre-removal validation fails:
1. **STOP source cleanup**: Do not remove any content from source files
2. **Report specific failures**: List exactly what validation checks failed
3. **Preserve source files**: Keep all source content intact until carry-over is verified
4. **Fix destination files**: Correct any issues in destination files before proceeding
5. **Re-run validation**: Perform pre-removal validation again after fixes
6. **Await user approval**: Only proceed with source cleanup after successful validation

### Validation Failure Response
1. **STOP immediately**: Do not proceed to next day if validation fails
2. **Report specific failures**: List exactly what validation checks failed
3. **Preserve original state**: Keep source files unchanged until issues are resolved
4. **Offer rollback**: If changes were already made, offer to restore original state
5. **Request user guidance**: Ask user how to proceed with failed validation

### Rollback Procedures
1. **Restore source files**: Revert any changes made to original daily note files
2. **Remove destination additions**: Delete any tasks added to destination files
3. **Verify restoration**: Confirm original state is fully restored
4. **Re-run validation**: Perform full validation on restored files
5. **Report restoration**: Confirm successful rollback to user

### Content Loss Prevention
- **Never delete original content**: Only move tasks, never remove them
- **Maintain backups**: Keep original file state before any modifications
- **Atomic operations**: Either complete the full day's carry-over or rollback completely
- **User confirmation required**: No changes are permanent without explicit user approval

## Output Format

### Day-by-Day Carry Over Process

**For each day, present results in this format:**

**If no incomplete tasks found:**
```
#### Processing Date: YYYY-MM-DD
**No incomplete tasks found - proceeding to next day automatically...**
```

**If incomplete tasks found:**
- Note: No "carried over" messages will be added to source files - they will remain clean for productivity analysis

#### Processing Date: YYYY-MM-DD

**PRE-PROCESSING VALIDATION:**
```
VALIDATION REPORT for YYYY-MM-DD:
✓ Source file content inventory: [X] total tasks found
  - [X] completed tasks (`* [x]`) - will remain in source
  - [X] incomplete tasks (`* [ ]`) - will be moved
  - [X] regular bullets (`*`) - will remain in source
✓ Meeting notes identified: [X] meeting sections - will remain untouched
✓ Hierarchy mapping: [X] parent-child relationships documented
✓ Date tag audit: [X] existing date tags recorded
```

**Tasks to carry over from this date:**
- [ ] [Task description] → **Proposed destination**: [Target date/file]
- [ ] [Task description] → **Proposed destination**: [Target date/file]

**POST-PROCESSING VALIDATION (after user approval):**
```
VALIDATION REPORT for YYYY-MM-DD:
✓ Source file content preserved: [X] completed tasks remain
✓ Meeting notes preserved: [X] meeting sections remain untouched
✓ Tasks moved: [X] incomplete tasks → [destination files]
✓ Total task count: [X] (matches original)
✓ Hierarchy preserved: [X] parent-child relationships maintained
✓ Date tags transferred: [X] tags properly formatted
✓ No duplication detected
✓ No content loss detected
```

**Awaiting confirmation to proceed to next day...**

---

### Final Consolidated Output (After All Days Processed)

## 🏢 Work Tasks

### 🔥 [Urgent Theme/Workstream Name]
- [ ] [Task] >2025-01-01
- [ ] [Task] >2025-01-02
- [ ] [Task] >2025-01-05

### 📅 [Standard Theme/Workstream]
- [ ] [Task] >2025-01-10
- [ ] [Task] >2025-01-15

### 📋 [Lower Priority Theme/Workstream]
- [ ] [Task] >2025-01-03

## 🏡 Personal Tasks

### 🔥 [Urgent Life Area/Theme]
- [ ] [Task] >2025-01-01
- [ ] [Task] >2025-01-02

### 📅 [Standard Life Area/Theme]
- [ ] [Task] >2025-01-05
- [ ] [Task] >2025-01-10

### 📋 [Lower Priority Life Area/Theme]
- [ ] [Task] >2025-01-15

### Recommendations
1. **Priority Shifts**: Most critical tasks to reschedule today
2. **Date Suggestions**: Specific dates for unscheduled tasks
3. **Cleanup Needed**: Duplicate or obsolete tasks to remove
4. **Pattern Analysis**: Recurring tasks that keep getting postponed

## Example: Daily Note Carry Over (2-Week Chronological Processing with Confirmation)

**Processing Order**: Start with oldest date in 2-week window (e.g., 2025-01-01), then proceed day by day to most recent (2025-01-15)

**Confirmation Process**: After each day's processing, present results and await user approval before proceeding to the next day

### Example Confirmation Process with Validation

#### Processing Date: 2025-01-15

**PRE-PROCESSING VALIDATION:**
```
VALIDATION REPORT for 2025-01-15:
✓ Source file content inventory: 10 total tasks found
  - 3 completed tasks (`* [x]`) - will remain in source
  - 7 incomplete tasks (`* [ ]`) - will be moved
  - 0 regular bullets (`*`) - will remain in source
✓ Meeting notes identified: 1 meeting section - will remain untouched
✓ Hierarchy mapping: 2 parent-child relationships documented
✓ Date tag audit: 0 existing date tags recorded
```

**Tasks to carry over from this date:**
- [ ] Prepare presentation for client meeting → **Proposed destination**: 2025-01-16 (Next Business Day - Work)
- [ ] Add financial projections → **Proposed destination**: 2025-01-16 (Next Business Day - Work)
- [ ] Review with team lead → **Proposed destination**: 2025-01-16 (Next Business Day - Work)
- [ ] Schedule dentist appointment → **Proposed destination**: 2025-01-18 (Upcoming Saturday - Personal)
- [ ] Plan weekend trip → **Proposed destination**: 2025-01-18 (Upcoming Saturday - Personal)
- [ ] Research hotels → **Proposed destination**: 2025-01-18 (Upcoming Saturday - Personal)
- [ ] Book flights → **Proposed destination**: 2025-01-18 (Upcoming Saturday - Personal)

**POST-PROCESSING VALIDATION (after user approval):**
```
VALIDATION REPORT for 2025-01-15:
✓ Source file content preserved: 3 completed tasks remain
✓ Meeting notes preserved: 1 meeting section remains untouched
✓ Tasks moved: 7 incomplete tasks → 2025-01-16, 2025-01-17
✓ Total task count: 10 (matches original: 3 remain + 7 moved = 10)
✓ Hierarchy preserved: 2 parent-child relationships maintained
✓ Date tags transferred: 7 tags properly formatted
✓ No duplication detected
✓ No content loss detected
```

**Awaiting confirmation to proceed to next day...**

---

### Yesterday's File (2025-01-15.md) - BEFORE Carry Over
```
# 2025-01-15 Wednesday

## Work Tasks
* [x] Review Q4 budget report
    * [x] Check expense categories
    * [x] Validate department allocations
* [ ] Prepare presentation for client meeting
    * [x] Create slide deck outline
    * [ ] Add financial projections
    * [ ] Review with team lead
* [x] Submit timesheet

## Personal Tasks  
* [ ] Schedule dentist appointment
* [x] Grocery shopping
    * [x] Buy vegetables
    * [x] Get milk and eggs
* [ ] Plan weekend trip
    * [ ] Research hotels
    * [ ] Book flights
    * [x] Check weather forecast

## Meeting Notes - Team Standup
* [x] Attended Team Standup meeting (notes: [[🏢 250115 Team Standup]]) @done(2025-01-15 11:46 PM)
* [ ] Action items from [[🏢 250115 Team Standup]]
	* [ ] Follow up on Q1 planning with Sarah >2025-01-15
	* [ ] Review new API documentation >2025-01-15
	* [ ] Schedule demo for next week >2025-01-15

## Journal
Had a productive day at work. The budget review went smoothly...
```

### Yesterday's File (2025-01-15.md) - AFTER Carry Over
```
# 2025-01-15 Wednesday

## Work Tasks
* [x] Review Q4 budget report
    * [x] Check expense categories
    * [x] Validate department allocations
* Prepare presentation for client meeting
    * [x] Create slide deck outline
* [x] Submit timesheet

## Personal Tasks  
* [x] Grocery shopping
    * [x] Buy vegetables
    * [x] Get milk and eggs
* Plan weekend trip
    * [x] Check weather forecast

## Meeting Notes - Team Standup
* [x] Attended Team Standup meeting (notes: [[🏢 250115 Team Standup]]) @done(2025-01-15 11:46 PM)
* [ ] Action items from [[🏢 250115 Team Standup]]
	* [ ] Follow up on Q1 planning with Sarah >2025-01-15
	* [ ] Review new API documentation >2025-01-15
	* [ ] Schedule demo for next week >2025-01-15

## Journal
Had a productive day at work. The budget review went smoothly...
```

### Next Business Day File (2025-01-16.md) - AFTER Carry Over
```
# 2025-01-16 Thursday

## 🏢 Work Tasks

### 🔥 Client Relations
* [ ] Existing client task from previous day
* [ ] Prepare presentation for client meeting >2025-01-15
    * [ ] Add financial projections >2025-01-15
    * [ ] Review with team lead >2025-01-15
```

**Note**: Tasks were merged into existing "Client Relations" theme instead of creating duplicate headers.

### Upcoming Saturday File (2025-01-18.md) - AFTER Carry Over
```
# 2025-01-18 Saturday

## 🏡 Personal Tasks

### 🔥 Health & Wellness
* [ ] Schedule dentist appointment >2025-01-01 [2 weeks]

### 📅 Travel & Recreation
* [ ] Plan weekend trip >2025-01-15
    * [ ] Research hotels >2025-01-15
    * [ ] Book flights >2025-01-15
```

**Key Points Demonstrated:**
- **2-Week Source Window**: Only process source files from the last 14 days, starting from oldest date
- **Chronological Processing**: Process each day sequentially from oldest to newest to ensure accurate carry-over tracking
- **Destination Flexibility**: Carry-over destinations can be any future date, not limited to the 2-week window
- **Conditional Confirmation**: Only request confirmation when changes are needed; skip confirmation for days with no incomplete tasks
- **Day-by-Day Control**: User can review and modify each day's carry-over before moving forward (only when changes needed)
- **Theme Merging**: Merge tasks into existing themes when carrying over to files that already have content
- **Content Validation**: Pre and post-processing validation ensures no content loss or duplication
- **Integrity Checks**: Task counts, hierarchy preservation, and date tag consistency are verified
- **Error Handling**: Rollback procedures and validation failure responses protect against data loss
- **Atomic Operations**: Either complete the full day's carry-over or rollback completely
- **Meeting Notes Preservation**: All meeting sections remain completely untouched in original files
- Completed tasks (`* [x]`) remain in yesterday's file as completed markdown tasks
- Incomplete tasks (`* [ ]`) move to today with `>2025-01-15` date tags
- Parent tasks with mixed completion status: convert to regular bullet points in original file to preserve completed subtask context
- Parent tasks that are fully completed: remain as `* [x]` completed markdown tasks
- Only incomplete subtasks move with carried over parent tasks
- Carry over tracking: Tasks with older date tags get `[X weeks]` indicators (e.g., dentist appointment from 2025-01-01 shows `[2 weeks]`)
- Journal entries remain untouched in original file
- **Business Day Logic**: Work tasks go to next business day, personal tasks go to upcoming Saturday
- **Content Preservation**: Never delete original content - only move tasks with full validation
- **Task Removal**: Incomplete tasks are completely removed from original files, not marked as done
- **Clean Source Files**: No "carried over" messages added to source files - keep them clean for productivity analysis
- **Meeting Exclusion**: Tasks within meeting sections are never carried over, preserving meeting context
- **Weekend Consolidation**: All personal tasks are consolidated to Saturday for weekend processing
- **Reference Organization**: All reference sections are converted to actionable "Move reference to the right place" tasks
- **Content Organization**: Scattered content is organized into logical sections before carry-over begins
- **Meeting Notes Extraction**: Meeting notes are extracted into individual files with proper templates before carry-over
- **Action Item Hierarchy**: Meeting action items are created as incomplete parent tasks with individual action items as subtasks
- **Proper Markdown Format**: Use `* [x]` for completed tasks with `@done()` annotations, never emoji checkmarks
- **Date Tag Precision**: Only parent-level actionable tasks get date tags, not subtasks or context items
- **Task vs Context Distinction**: Non-actionable context becomes bullet points, actionable tasks remain as tasks
- **No Unnecessary Conversion**: Tasks are moved as tasks, not converted to bullet points unless truly non-actionable
- **Pre-Removal Validation**: Validate carry-over success before removing any source content
- **Source Cleanup Safety**: Only remove source content after explicit validation and user approval
- **Business Day Calculation**: Use timezone-aware date calculation to determine correct next business day
- **Date Validation**: Always verify calculated business days using date commands before proceeding
- **Emoji Mapping System**: Use established emoji categories for proper task organization and grouping
- **Self-Healing Emoji Mapping**: If emoji mapping concerns are raised, reference the established emoji system and correct categorization
- **Username Path Handling**: Handle both `oeid` and `omareid` usernames for cross-machine compatibility
- **Reference Directory Scanning**: Scan Plans directories when needed to understand actual emoji usage patterns
- **Daily File Headers**: Ensure all files with tasks have proper date headers and editing links
- **Username Path Handling**: Handle both `oeid` and `omareid` usernames in editing links
- **No Fake Meeting Records**: Only create meeting attendance records if actual meeting note files exist
- **Complete Task Removal**: Incomplete tasks are completely removed from source files, not converted to new action items
- **Empty File Cleanup**: Remove files that have no content after cleanup (only date headers remain)