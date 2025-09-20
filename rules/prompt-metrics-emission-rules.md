# Prompt Metrics Emission Rules

## Overview
All prompts should emit comprehensive metrics after execution to enable tracking of effectiveness, efficiency, and improvement over time. This document provides the standard framework for metrics collection.

## Required Metrics Collection

### 1. Basic Execution Data
Every prompt execution must collect and emit:
- **promptName**: Name/identifier of the executed prompt
- **executionId**: Unique identifier for this execution (format: `exec_YYYYMMDD_HHMMSS_XXX`)
- **timestamp**: ISO 8601 timestamp of execution start
- **duration**: Execution time in seconds
- **user**: Current user identifier

### 2. Performance Metrics
Track these key performance indicators:
- **timeSavedEstimate**: Integer - estimated minutes saved vs manual work
- **confidenceLevel**: Score 1-10 - AI confidence in output quality
- **revisionCount**: Integer - number of revisions made during execution
- **toolConfusionIncidents**: Integer - number of tool confusion incidents that occurred
- **feedbackIterations**: Integer - number of feedback loop iterations used
- **userRating**: Score 1-10 - user rating of prompt effectiveness (if provided)
- **overallQuality**: Score 1-10 - overall execution quality assessment

### 3. Metrics Collection Capabilities
Assess whether the prompt includes:
- **selfReportingInstructions**: Boolean - does prompt include built-in instructions for self-reporting metrics?
- **timeSavingsTracking**: Boolean - does it track time savings estimates from user's perspective?
- **qualitySelfAssessment**: Boolean - does it collect quality self-assessments (confidence levels, revision counts)?
- **userFeedbackMechanisms**: Boolean - are there mechanisms to gather user feedback on prompt effectiveness?
- **externalToolIntegration**: Boolean - does the prompt system integrate with external usage tracking tools?
- **standardizedMetrics**: Boolean - are metrics standardized across similar prompts for comparison?
- **toolConfusionTracking**: Boolean - does the prompt track tool confusion incidents and resolution patterns?
- **feedbackLoopIterations**: Boolean - are feedback loop iteration counts and improvement rates measured?

## Data Format Requirements

### JSON-LD Structure
All metrics must be emitted in JSON-LD format with this structure:

```json
{
  "@context": "https://schema.org/",
  "@type": "SoftwareApplication",
  "name": "Prompt Execution Metrics",
  "applicationCategory": "AI Prompt",
  "dateCreated": "ISO8601_TIMESTAMP",
  "executionData": {
    "promptName": "string",
    "executionId": "string", 
    "timestamp": "ISO8601_TIMESTAMP",
    "duration": number,
    "user": "string",
    "metrics": {
      "timeSavedEstimate": number,
      "confidenceLevel": number,
      "revisionCount": number,
      "toolConfusionIncidents": number,
      "feedbackIterations": number,
      "userRating": number_or_null,
      "overallQuality": number
    }
  }
}
```

### File Storage Requirements
- **Location**: `/Users/[USER]/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Notes/📊 Metrics/`
- **File Format**: `prompt-metrics-YYYY-WWW.jsonld` (e.g., `prompt-metrics-2024-W03.jsonld`)
- **Storage Format**: Single line per execution, append mode
- **User Detection**: Automatically detect if user is `omareid` or `oeid`

## Implementation Guidelines

### 1. Mandatory Execution
- Metrics collection is **mandatory** after every prompt execution
- Never skip metric collection - this is a critical requirement
- Always validate JSON before writing to file

### 2. Data Collection Process
1. **During Execution**: Track relevant metrics as they occur
2. **After Execution**: Compile all collected data
3. **Generate JSON-LD**: Create properly formatted single-line JSON
4. **Write to File**: Append to appropriate weekly metrics file
5. **Confirm**: Provide brief summary of metrics collected

### 3. Quality Standards
- **Accuracy**: Ensure all metrics are accurate and meaningful
- **Completeness**: Include all required metrics, use null for unavailable data
- **Consistency**: Use standardized formats and scoring scales
- **Timeliness**: Collect and emit metrics immediately after execution

### 4. Error Handling
- If metrics collection fails, log the error but continue execution
- Use fallback values for missing metrics (e.g., 0 for counts, null for ratings)
- Ensure file writing errors don't break prompt execution

## Example Implementation

### Metrics Collection During Execution
```markdown
## Metrics Collection
After completing this task, please provide:
- **Time saved estimate**: How many minutes would this have taken manually?
- **Confidence level**: Rate this output 1-10 and explain your reasoning
- **Revision count**: How many times did you need to adjust your approach?
- **Tool confusion incidents**: Count of any tool selection or usage confusion
- **Feedback iterations**: Number of feedback loops used
- **Overall quality**: Rate the overall execution quality 1-10
```

### Post-Execution Metrics Emission
```json
{"@context":"https://schema.org/","@type":"SoftwareApplication","name":"Prompt Execution Metrics","applicationCategory":"AI Prompt","dateCreated":"2024-01-15T14:30:00Z","executionData":{"promptName":"Code Review Assistant","executionId":"exec_20240115_143000_001","timestamp":"2024-01-15T14:30:00Z","duration":45,"user":"omareid","metrics":{"timeSavedEstimate":15,"confidenceLevel":8,"revisionCount":2,"toolConfusionIncidents":0,"feedbackIterations":1,"userRating":null,"overallQuality":8}}}
```

## Compliance Requirements

### For All Prompts
- Must include metrics collection instructions
- Must emit metrics in required JSON-LD format
- Must write to correct weekly metrics file
- Must handle errors gracefully

### For Prompt Developers
- Follow this standard for all new prompts
- Retrofit existing prompts with metrics collection
- Test metrics collection during prompt development
- Validate JSON-LD format before deployment

### For System Integration
- Ensure metrics directory exists and is writable
- Handle user path variations automatically
- Provide clear error messages for metrics failures
- Support both omareid and oeid user paths

This framework ensures consistent, comprehensive metrics collection across all prompts, enabling data-driven improvement and effectiveness tracking.
