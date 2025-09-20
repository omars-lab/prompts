# # SQL Query Analyzer Prompt
Analyze the provided SQL query and create comprehensive documentation with a PlantUML diagram. 
**Output Requirements:**
- Create a markdown file named `[sql-filename].md` (e.g., `user-metrics.md` for `user-metrics.sql`)
- Include all analysis sections in this dedicated file
- Update the original SQL file with cleaned formatting
- Generate actual PlantUML diagram using the plantuml tool
Follow this structure:
## Query Analysis Template
### 1. Purpose & Overview
- Brief description of what the query does
- Business context and use case
### 2. Data Sources
List each table/view with:
-**Raw Tables**: Source system tables (production databases)
-**Derived Tables**: Views, materialized views, or processed tables
- Key fields used
- Role in the query
### 3. Query Flow
Describe the logical flow:
- CTEs and their purpose
- Join relationships
- Key transformations
### 4. Key Metrics & Outputs
- Main calculated fields
- Grouping dimensions
- Business meaning of results
### 5. PlantUML Diagram
Create a high-level diagram showing:
-**Raw tables** as blue rectangles
-**Derived tables** as green rectangles 
-**CTEs** as yellow rounded rectangles
-**Final output** as a database symbol
- Arrows showing data flow
- Key fields only (3-5 per entity)
**IMPORTANT: Use the plantuml tool to generate the actual diagram**
**SVG Validation Process:**
- After downloading SVG, read it with `fsRead` to check for errors
- If SVG contains "Syntax Error?" or error messages, the PlantUML syntax is invalid
- Common issues: Invalid `!define` syntax, missing quotes, incorrect entity definitions
- Fix syntax and regenerate until SVG shows actual diagram
Create PlantUML content using this template:
```plantuml
@startuml
!define RAW_TABLE rectangle <<Raw Table>> #lightblue
!define DERIVED_TABLE rectangle <<Derived Table>> #lightgreen
!define CTE rectangle <<CTE>> #lightyellow
!define OUTPUT database
RAW_TABLE "prod.raw_events" as raw1 {
 + event_id
 + timestamp
 + user_id
}
DERIVED_TABLE "analytics.processed_events" as derived1 {
 + session_id
 + event_type
 + processed_date
}
CTE "filtered_data" as cte1 {
 + session_id
 + metric_value
 + category
}
OUTPUT "Final Results" as output {
 + date
 + total_count
 + conversion_rate
}
raw1 --> cte1 : filters
derived1 --> cte1 : joins
cte1 --> output : aggregates
@enduml
```
Then use: `plantuml(operation="encode", content="[plantuml_content]")`
**Iterative PlantUML Generation Process:**
**FEEDBACK LOOP - Repeat until intent matches output:**
1.**Generate PlantUML**: Use `plantuml(operation="encode", content="[plantuml_content]")`
2.**Download SVG**: `executeBash(command="/usr/local/bin/kcurl -s -o [sql-filename].svg '[svg_url]'", cwd="[current_directory]")`
3.**Validate SVG**: Read SVG with `fsRead` and analyze content
4.**Intent Verification**: Check if SVG matches intended diagram:
- Are all entities (tables/CTEs/outputs) visible?
- Are relationships/arrows correct?
- Are colors and styling applied properly?
- Does layout make logical sense?
5.**Error Analysis**: If SVG shows errors or doesn't match intent:
- Identify specific PlantUML syntax issues
- Note what worked vs what failed
- Update PlantUML syntax based on findings
6.**Self-Improvement**: Learn from each iteration:
- Document successful PlantUML patterns
- Avoid syntax that caused errors
- Refine entity definitions and relationships
7.**Iterate**: Return to step 1 with improved PlantUML until perfect match
8.**Self-Heal Prompt**: Update the "PlantUML Best Practices" section with new learnings
9.**Final Embed**: `![Query Diagram](./{sql-filename}.svg)`
**PlantUML Best Practices (auto-updated from learnings):**
- ✅ Use `rectangle "name" as alias #color` - separate color definition works
- ❌ Avoid `rectangle "name" <<stereotype>> #color` - causes syntax conflicts
- ✅ Use `note right of alias` for field lists - clean and reliable
- ✅ Simple `database` symbol works well for outputs
- ✅ `as alias` creates cleaner arrow references
- Use quoted entity names for tables with special characters
- Keep field lists concise (3-5 items max)
- Test arrows and relationships incrementally
**SELF-HEALING REQUIREMENT:**
After each successful feedback loop, UPDATE this prompt section with:
1. ✅ What syntax patterns worked
2. ❌ What syntax patterns failed
3. 🔄 New successful alternatives discovered
4. Save learnings to prevent future iterations on same issues
### 6. Filters & Constraints
- Date ranges
- Region/marketplace filters
- Other key constraints
### 7. Performance Considerations
- Potential bottlenecks
- Optimization suggestions
### 8. Cleaned SQL Structure
**CRITICAL: Preserve exact SQL logic - only improve formatting, never change implementation**
Rewrite the query with proper formatting:
- Use descriptive CTE names with `WITH cte_name AS ()`
- Break complex WHERE clauses into readable blocks
- Add comments explaining business logic
- Consistent indentation and spacing
- Group related fields together
-**Maintain identical WHERE conditions, JOINs, and CASE logic**
-**Preserve all field names, aliases, and calculations exactly**
Example structure:
```sql
-- Query Purpose: [Brief description]
WITH source_data AS (
SELECT
-- Key identifiers
 field1,
 field2,

-- Business fields
 field3,
 field4
FROM table_name
WHERE condition1 = 'value'
AND condition2 IN ('val1', 'val2')
),
processed_data AS (
SELECT
 field1,
CASE
WHEN condition THEN'result1'
ELSE'result2'
ENDAS derived_field
FROM source_data
)
SELECT *
FROM processed_data
ORDER BY field1;
```
---
**Instructions:**
1. Focus on business logic, not technical implementation details
2. Include only the most important 3-5 fields per entity in the diagram
3. Use clear, business-friendly language
4. Keep the diagram simple and readable
5. Highlight the main data transformation flow
6.**Always provide a cleaned version of the original SQL** with proper CTE structure
7.**NEVER alter SQL logic, conditions, or calculations - only improve readability**
8.**Create a separate markdown file** named `[original-sql-filename].md` containing the complete analysis
9.**Update the original SQL file** with the cleaned version while preserving exact logic
10.**Generate PlantUML diagram** using the plantuml tool and include the encoded URL in the markdown
11.**Execute feedback loop** until PlantUML intent perfectly matches generated SVG
12.**Self-improve PlantUML patterns** based on what works vs fails during iterations
13.**MANDATORY: Update this prompt** - Modify the "PlantUML Best Practices" section with new learnings using `fsReplace`