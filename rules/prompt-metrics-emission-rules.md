# Prompt Metrics Emission Rules

## Overview
All prompts should emit comprehensive metrics after execution to enable tracking of effectiveness, efficiency, and improvement over time. This document provides the standard framework for metrics collection.

## Required Metrics Collection

### 1. Basic Execution Data
Every prompt execution must collect and emit:
- **promptName**: Name/identifier of the executed prompt
- **executionId**: Unique identifier for this execution (format: `exec_YYYYMMDD_HHMMSS_XXX`)
- **startTimestamp**: ISO 8601 timestamp of execution start
- **endTimestamp**: ISO 8601 timestamp of task completion
- **duration**: Execution time in seconds (calculated from start to end)
- **user**: Current user identifier

### 2. Performance Metrics
Track these key performance indicators:
- **timeSavedEstimate**: Integer - estimated minutes saved vs manual work
- **actualTimeSpent**: Integer - actual minutes spent in prompt interaction (from start to completion)
- **netTimeSavings**: Integer - time saved estimate minus actual time spent
- **efficiencyRatio**: Float - time saved / actual time spent (higher is better)
- **confidenceLevel**: Score 1-10 - AI confidence in output quality
- **revisionCount**: Integer - number of revisions made during execution
- **toolConfusionIncidents**: Integer - number of tool confusion incidents that occurred
- **feedbackIterations**: Integer - number of feedback loop iterations used
- **userRating**: Score 1-10 - user rating of prompt effectiveness (if provided)
- **overallQuality**: Score 1-10 - overall execution quality assessment

### 3. Prompt Awareness Requirements
All prompts must be aware they are being measured and should include:
- **Self-awareness instructions**: Clear indication that the prompt is being monitored for effectiveness
- **End-to-end tracking**: Understanding that metrics span from first interaction to final completion
- **Time consciousness**: Awareness of time spent vs time saved throughout execution
- **Self-assessment capability**: Ability to evaluate own performance and efficiency
- **User experience focus**: Consideration of user's time investment and satisfaction

### 4. Metrics Collection Capabilities
Assess whether the prompt includes:
- **selfReportingInstructions**: Boolean - does prompt include built-in instructions for self-reporting metrics?
- **timeSavingsTracking**: Boolean - does it track time savings estimates from user's perspective?
- **actualTimeTracking**: Boolean - does it track actual time spent in prompt interaction?
- **efficiencyCalculation**: Boolean - does it calculate net savings and efficiency ratios?
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
    "startTimestamp": "ISO8601_TIMESTAMP",
    "endTimestamp": "ISO8601_TIMESTAMP",
    "duration": number,
    "user": "string",
    "metrics": {
      "timeSavedEstimate": number,
      "actualTimeSpent": number,
      "netTimeSavings": number,
      "efficiencyRatio": number,
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
## Performance Monitoring & Self-Awareness

**IMPORTANT**: This prompt is being monitored for effectiveness and efficiency. You should be aware of your performance throughout execution and assess your impact from start to completion.

## Metrics Collection
After completing this task, please provide:
- **Time saved estimate**: How many minutes would this have taken manually? Consider:
  - Time to think through the problem and solution approach
  - Time to manually make all the edits/changes the agent made
  - Time to research, plan, and execute each step
  - Time to review and validate the work
- **Actual time spent**: How many minutes did this interaction take from start to completion?
- **Net time savings**: Time saved estimate minus actual time spent
- **Efficiency ratio**: Time saved / actual time spent (higher is better)
- **Confidence level**: Rate this output 1-10 and explain your reasoning
- **Revision count**: How many times did you need to adjust your approach?
- **Tool confusion incidents**: Count of any tool selection or usage confusion
- **Feedback iterations**: Number of feedback loops used
- **Overall quality**: Rate the overall execution quality 1-10
```

### Post-Execution Metrics Emission
```json
{"@context":"https://schema.org/","@type":"SoftwareApplication","name":"Prompt Execution Metrics","applicationCategory":"AI Prompt","dateCreated":"2024-01-15T14:30:00Z","executionData":{"promptName":"Code Review Assistant","executionId":"exec_20240115_143000_001","startTimestamp":"2024-01-15T14:30:00Z","endTimestamp":"2024-01-15T14:30:45Z","duration":45,"user":"omareid","metrics":{"timeSavedEstimate":15,"actualTimeSpent":3,"netTimeSavings":12,"efficiencyRatio":5.0,"confidenceLevel":8,"revisionCount":2,"toolConfusionIncidents":0,"feedbackIterations":1,"userRating":null,"overallQuality":8}}}
```

## Key Questions & Analysis Formulas

The metrics collected should answer these critical questions:

**1. Time Efficiency Analysis**
- **Question**: "Am I actually saving time using AI assistance?"
- **Formula**: `Net Time Savings = Time Saved Estimate - Actual Time Spent`
- **Interpretation**: Positive values indicate time savings, negative values indicate overhead

**2. Efficiency Ratio Assessment**
- **Question**: "How efficient is this prompt compared to manual work?"
- **Formula**: `Efficiency Ratio = Time Saved Estimate / Actual Time Spent`
- **Interpretation**: 
  - Ratio > 2.0: Highly efficient (saving significant time)
  - Ratio 1.0-2.0: Moderately efficient (some time savings)
  - Ratio < 1.0: Inefficient (taking longer than manual work)

**3. Quality vs Speed Trade-off**
- **Question**: "Am I sacrificing quality for speed, or getting both?"
- **Formula**: `Quality Efficiency = Overall Quality Score / (Actual Time Spent / 10)`
- **Interpretation**: Higher values indicate good quality in reasonable time

**4. Iteration Impact Analysis**
- **Question**: "How much do revisions and feedback loops impact efficiency?"
- **Formula**: `Iteration Efficiency = Net Time Savings / (1 + Revision Count + Feedback Iterations)`
- **Interpretation**: Shows efficiency adjusted for iteration overhead

**5. Tool Usage Effectiveness**
- **Question**: "Are tool confusion incidents significantly impacting performance?"
- **Formula**: `Tool Efficiency = Net Time Savings - (Tool Confusion Incidents × 5)`
- **Interpretation**: Penalizes time lost due to tool confusion (5 minutes per incident)

**6. User Satisfaction Correlation**
- **Question**: "Does user satisfaction correlate with efficiency metrics?"
- **Formula**: `Satisfaction Efficiency = (User Rating / 10) × Efficiency Ratio`
- **Interpretation**: Combines user satisfaction with time efficiency

**7. Confidence vs Performance Alignment**
- **Question**: "Is the AI's confidence level aligned with actual performance?"
- **Formula**: `Confidence Accuracy = |Confidence Level - Overall Quality|`
- **Interpretation**: Lower values indicate better self-assessment accuracy

**8. End-to-End Performance Score**
- **Question**: "What's the overall performance score for this prompt execution?"
- **Formula**: `Performance Score = (Efficiency Ratio × 0.4) + (Overall Quality / 10 × 0.3) + (User Rating / 10 × 0.2) + (Confidence Accuracy / 10 × 0.1)`
- **Interpretation**: Weighted composite score (0-1 scale, higher is better)

## Measuring Prompt Improvement Over Time

To determine if prompts are getting better, track these improvement indicators across multiple executions:

**1. Efficiency Trend Analysis**
- **Question**: "Is this prompt becoming more efficient over time?"
- **Formula**: `Efficiency Trend = (Recent 5 executions average) - (Previous 5 executions average)`
- **Interpretation**: Positive values indicate improving efficiency
- **Tracking**: Calculate rolling averages every 5-10 executions

**2. Quality Consistency Improvement**
- **Question**: "Is the prompt delivering more consistent quality?"
- **Formula**: `Quality Consistency = 1 - (Standard Deviation of Overall Quality scores)`
- **Interpretation**: Higher values indicate more consistent quality
- **Tracking**: Monitor standard deviation over 10+ executions

**3. Learning Curve Measurement**
- **Question**: "Is the prompt learning from feedback and improving?"
- **Formula**: `Learning Rate = (Recent User Ratings average) - (Initial User Ratings average)`
- **Interpretation**: Positive values indicate learning and improvement
- **Tracking**: Compare first 5 vs last 5 user ratings

**4. Error Reduction Tracking**
- **Question**: "Are tool confusion incidents and revisions decreasing?"
- **Formula**: `Error Reduction = (Initial Error Rate) - (Recent Error Rate)`
- **Where**: `Error Rate = (Tool Confusion Incidents + Revision Count) / Total Executions`
- **Interpretation**: Positive values indicate fewer errors over time

**5. Speed Improvement Analysis**
- **Question**: "Is the prompt getting faster at delivering results?"
- **Formula**: `Speed Improvement = (Initial Average Time) - (Recent Average Time)`
- **Interpretation**: Positive values indicate faster execution
- **Tracking**: Compare first 10 vs last 10 execution times

**6. User Satisfaction Growth**
- **Question**: "Are users becoming more satisfied with the prompt?"
- **Formula**: `Satisfaction Growth = (Recent User Rating average) - (Historical User Rating average)`
- **Interpretation**: Positive values indicate improving user satisfaction
- **Tracking**: Monitor user rating trends over time

**7. Confidence Accuracy Improvement**
- **Question**: "Is the prompt becoming better at self-assessment?"
- **Formula**: `Confidence Improvement = (Initial Confidence Accuracy) - (Recent Confidence Accuracy)`
- **Where**: `Confidence Accuracy = |Confidence Level - Overall Quality|`
- **Interpretation**: Lower values indicate better self-assessment over time

**8. Overall Improvement Score**
- **Question**: "What's the overall improvement trend for this prompt?"
- **Formula**: `Improvement Score = (Efficiency Trend × 0.3) + (Quality Consistency × 0.2) + (Learning Rate × 0.2) + (Error Reduction × 0.15) + (Speed Improvement × 0.1) + (Satisfaction Growth × 0.05)`
- **Interpretation**: Positive values indicate overall improvement, negative values indicate degradation

**9. Improvement Velocity**
- **Question**: "How quickly is this prompt improving?"
- **Formula**: `Improvement Velocity = Overall Improvement Score / Number of Executions`
- **Interpretation**: Higher values indicate faster improvement rate

**10. Plateau Detection**
- **Question**: "Has this prompt reached a performance plateau?"
- **Formula**: `Plateau Indicator = Standard Deviation of Recent 10 Performance Scores`
- **Interpretation**: Low values (< 0.1) may indicate plateau, high values indicate ongoing improvement

### Improvement Tracking Recommendations

**Data Collection Requirements:**
- Track metrics for minimum 20 executions before analyzing trends
- Use rolling averages for smoothing out execution-to-execution variations
- Compare performance across similar task types for meaningful analysis

**Analysis Frequency:**
- Weekly: Check basic efficiency and quality trends
- Monthly: Perform comprehensive improvement analysis
- Quarterly: Assess long-term learning and plateau detection

**Improvement Thresholds:**
- **Significant Improvement**: > 20% increase in key metrics
- **Moderate Improvement**: 10-20% increase in key metrics
- **Stable Performance**: ±10% variation in key metrics
- **Concerning Degradation**: > 10% decrease in key metrics

## Usage Frequency & Pattern Analysis

To understand prompt adoption and usage patterns, track these usage metrics:

**1. Usage Frequency Analysis**
- **Question**: "Am I regularly using this prompt?"
- **Formula**: `Usage Frequency = Number of Executions / Time Period (days)`
- **Interpretation**: 
  - > 1 execution/day: High frequency usage
  - 0.2-1 execution/day: Regular usage
  - < 0.2 execution/day: Infrequent usage
- **Tracking**: Calculate daily, weekly, and monthly usage rates

**2. Usage Consistency Measurement**
- **Question**: "Is my usage of this prompt consistent over time?"
- **Formula**: `Usage Consistency = 1 - (Standard Deviation of Daily Usage Counts)`
- **Interpretation**: Higher values indicate more consistent usage patterns
- **Tracking**: Monitor daily usage variation over 30+ days

**3. Usage Growth Rate**
- **Question**: "Is my usage of this prompt increasing over time?"
- **Formula**: `Usage Growth = (Recent Period Usage) - (Previous Period Usage) / Previous Period Usage`
- **Interpretation**: Positive values indicate growing adoption
- **Tracking**: Compare monthly usage rates

**4. Usage Concentration Analysis**
- **Question**: "Do I use this prompt for specific types of tasks?"
- **Formula**: `Usage Concentration = Number of Unique Task Types / Total Executions`
- **Interpretation**: Lower values indicate specialized usage, higher values indicate general-purpose usage
- **Tracking**: Categorize executions by task type

**5. Usage Recency Score**
- **Question**: "How recently have I used this prompt?"
- **Formula**: `Usage Recency = 1 / (Days Since Last Execution + 1)`
- **Interpretation**: Higher values indicate more recent usage
- **Tracking**: Monitor time since last execution

**6. Usage Burst Detection**
- **Question**: "Do I use this prompt in bursts or consistently?"
- **Formula**: `Usage Burstiness = (Maximum Daily Usage) / (Average Daily Usage)`
- **Interpretation**: Higher values indicate bursty usage patterns
- **Tracking**: Identify periods of concentrated usage

**7. Usage Abandonment Risk**
- **Question**: "Am I at risk of abandoning this prompt?"
- **Formula**: `Abandonment Risk = (Days Since Last Execution) / (Average Days Between Executions)`
- **Interpretation**: Values > 2 may indicate abandonment risk
- **Tracking**: Monitor for extended periods without usage

**8. Usage Value Correlation**
- **Question**: "Does my usage frequency correlate with prompt value?"
- **Formula**: `Usage Value Correlation = Correlation(Usage Frequency, User Rating)`
- **Interpretation**: Positive correlation indicates value-driven usage
- **Tracking**: Analyze relationship between usage and satisfaction

**9. Usage Efficiency Trend**
- **Question**: "Am I using this prompt more efficiently over time?"
- **Formula**: `Usage Efficiency = (Total Time Saved) / (Total Time Spent)`
- **Interpretation**: Higher values indicate more efficient usage
- **Tracking**: Monitor cumulative efficiency over time

**10. Usage Pattern Classification**
- **Question**: "What type of user am I for this prompt?"
- **Classification**:
  - **Power User**: > 5 executions/week, high satisfaction
  - **Regular User**: 1-5 executions/week, consistent usage
  - **Occasional User**: < 1 execution/week, sporadic usage
  - **Trial User**: < 5 total executions, testing phase
  - **Abandoned User**: No usage in 30+ days

### Usage Tracking Recommendations

**Data Collection Requirements:**
- Track usage patterns for minimum 30 days before analysis
- Categorize executions by task type for pattern analysis
- Monitor usage frequency alongside performance metrics

**Analysis Frequency:**
- **Weekly**: Check usage frequency and recency
- **Monthly**: Analyze usage patterns and growth trends
- **Quarterly**: Assess long-term adoption and abandonment risk

**Usage Thresholds:**
- **High Adoption**: > 1 execution/day average
- **Regular Adoption**: 0.2-1 execution/day average
- **Low Adoption**: < 0.2 execution/day average
- **At Risk**: No usage for 14+ days
- **Abandoned**: No usage for 30+ days

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
