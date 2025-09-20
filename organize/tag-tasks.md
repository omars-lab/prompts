# Prompt: Tagging Tasks
You are tasked with tagging untagged tasks in my daily files to connect them with corresponding plan initiatives.

## Input Sources
1. **Daily Files**: `/Users/oeid/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Calendar`
   - Focus on YYYYMMDD.txt or YYYYMMDD.md format files
   - Ignore weekly files (2024-WW format) and empty files
2. **Plan Files**: `/Users/oeid/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Notes/🏢 Amazon/🏢📆 Plans`

## Tagging Process

### 1. Identify Untagged Tasks
- Scan daily files for tasks without hashtags
- Look for tasks that don't have corresponding plan references
- Focus on work-related tasks (ignore personal items)

### 2. Map to Plan Initiatives
Create tags based on plan file structure:
- **#sdlc** - ⚙️ SDLC related tasks
- **#growth** - 🌱 Growth and learning tasks  
- **#fsd** - 📊 FSD data platform tasks
- **#weblab** - 🧪 Weblab experimentation tasks
- **#sds** - 🚚 SDS-P0/P1 delivery system tasks
- **#qc** - 🛒 QC quality control tasks
- **#meeting** - Meeting attendance and follow-ups
- **#review** - Code reviews, document reviews
- **#planning** - Strategic planning and alignment

### 3. Suggest Tag Additions
For each untagged task, provide:
- **Task**: [Original task text]
- **Suggested Tag**: #[tag]
- **Rationale**: [Why this tag fits]
- **Plan File**: [Which plan file this relates to]

## Output Format

### Untagged Tasks Analysis

#### Tasks Needing Tags:
1. **Task**: "Follow up with team on deployment"
   - **Suggested Tag**: #sds
   - **Rationale**: Related to SDS deployment activities
   - **Plan File**: 🏢250730🚚 SDS Launch Readiness.txt

2. **Task**: "Review weblab configuration"
   - **Suggested Tag**: #weblab
   - **Rationale**: Weblab experimentation work
   - **Plan File**: 🏢250418🧪 Providing Weblab Guidance.txt

### Recommended Tag Updates
Provide the updated task format with tags added:
```
- [ ] Follow up with team on deployment #sds
- [ ] Review weblab configuration #weblab
```

### Tag Coverage Summary
- Total tasks reviewed: [X]
- Tasks already tagged: [X]
- Tasks needing tags: [X]
- New tags suggested: [X]