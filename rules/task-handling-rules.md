# Task Handling Rules

## Task Structure Preservation
- **Treat task chunks as cohesive units**: Move entire task hierarchies together, never separate parent tasks from their children
- **Respect indentation**: Maintain exact indentation levels to preserve task relationships
- **Preserve parent-child dependencies**: Indented sub-bullets indicate the parent cannot be completed without the child task

## Task Relationships
- **Recursive hierarchy**: Task dependencies can be nested multiple levels deep
- **Mixed content**: Children may be tasks (`* [ ]`), references, notes, or other content - keep all together
- **Structural integrity**: Never alter the internal structure of task chunks

## Allowed Modifications
You may ONLY:
1. **Move entire task chunks** to different priority sections
2. **Add/modify hashtags** on original tasks (e.g., `#urgent`, `#health`)
3. **Append scheduled dates** in format `>2025-01-01` or `>today` to tasks

## Forbidden Actions
- Do NOT edit task content or descriptions
- Do NOT separate parent tasks from their children
- Do NOT modify indentation or hierarchy
- Do NOT break apart task chunks
- Do NOT alter references or notes within task structures

## Example Task Chunk
```
* [ ] Plan vacation #travel
    * [ ] Research destinations
        - Check weather patterns
        - Read travel blogs
    * [ ] Book flights >2025-02-15
    * [ ] Reserve accommodations
```
This entire block moves together as one unit.