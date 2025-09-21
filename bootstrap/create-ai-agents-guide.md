# Prompt: Create AI-AGENTS Guide for Repository

## 🎯 Objective
Create a comprehensive `AI-AGENTS.md` file that serves as a guide for AI agents making edits to a repository. This file should provide clear instructions, constraints, and best practices to ensure consistent and safe modifications.

## 📋 Template Structure

### **1. Repository Overview Section**
```markdown
# AI Agents Guide for [Repository Name]

## 🎯 Repository Overview
- Brief description of the repository's purpose
- Key technologies and frameworks used
- Main components or modules
- Architecture patterns (if applicable)
```

### **2. Architecture & Key Components**
```markdown
## 🏗️ Architecture & Key Components

### **Core System Components**
- List main components/modules
- Explain relationships between components
- Highlight critical systems that shouldn't be modified

### **State Management**
- How state is managed (Redux, Context, local state)
- Key state variables and their purposes
- State flow patterns

### **Data Flow**
- How data moves through the system
- Key data structures and formats
- API endpoints and data sources
```

### **3. Design System & Styling**
```markdown
## 🎨 Design System & Styling

### **Color Scheme**
```css
/* Define exact color values */
--primary-color: #hex;
--secondary-color: #hex;
--accent-color: #hex;
```

### **Layout Principles**
- Grid systems or layout patterns
- Spacing conventions
- Responsive design breakpoints
- Typography standards

### **Component Styling Patterns**
- Common CSS classes and their usage
- Animation and transition standards
- Hover states and interactions
```

### **4. File Structure & Responsibilities**
```markdown
## 📁 File Structure & Responsibilities

### **Core Files**
- `src/App.js` - Main application component
- `src/components/` - Reusable UI components
- `src/styles/` - CSS and styling files
- `src/utils/` - Helper functions and utilities

### **Configuration Files**
- `package.json` - Dependencies and scripts
- `config/` - Environment and build configurations
- `public/` - Static assets

### **Documentation Files**
- `README.md` - User-facing documentation
- `docs/` - Technical documentation
- `AI-AGENTS.md` - This file
```

### **5. Development Guidelines**
```markdown
## 🔧 Development Guidelines

### **When Making Changes**

#### **Component Modifications**
- Always preserve [specific functionality]
- Maintain [specific patterns]
- Test [specific scenarios]
- Preserve [accessibility features]

#### **Styling Changes**
- Follow [design system]
- Maintain [responsive design]
- Preserve [specific animations]
- Keep [consistent spacing]

#### **Content Updates**
- Update [specific files] for content changes
- Maintain [data structure]
- Keep [both views in sync]
```

### **6. Common Patterns & Examples**
```markdown
## 🔄 Common Patterns

### **Adding New [Components/Features]**
```javascript
// Example code pattern
function NewComponent() {
  // Standard pattern to follow
}
```

### **Styling New Components**
```css
/* Follow established pattern */
.new-component {
  /* Use theme colors */
  /* Use consistent spacing */
  /* Add responsive design */
}
```

### **Data Structure Updates**
```javascript
// Example data structure
const newData = {
  // Standard format
};
```
```

### **7. Critical Rules & Constraints**
```markdown
## 🚨 Critical Rules & Constraints

### **DO NOT**
- ❌ Remove [critical functionality]
- ❌ Break [specific features]
- ❌ Change [design system] without good reason
- ❌ Remove [accessibility features]
- ❌ Break [responsive design]
- ❌ Modify [state management structure]

### **ALWAYS**
- ✅ Test changes in [specific scenarios]
- ✅ Maintain [design consistency]
- ✅ Preserve [responsive design]
- ✅ Keep [accessibility features]
- ✅ Update documentation if adding new features
- ✅ Use [consistent naming conventions]
- ✅ Follow [framework best practices]
```

### **8. Development Workflow**
```markdown
## 🛠️ Development Workflow

### **Before Making Changes**
1. **Read the current code** to understand the structure
2. **Check existing documentation** in [specific files]
3. **Understand [key systems]** and how components interact
4. **Plan the changes** to minimize breaking existing functionality

### **During Development**
1. **Make incremental changes** - don't rewrite entire components
2. **Test frequently** - check [specific scenarios] after each change
3. **Maintain consistency** - follow established patterns
4. **Preserve functionality** - don't break existing features

### **After Making Changes**
1. **Test [specific scenarios]** to ensure they work
2. **Check [responsive design]** on different screen sizes
3. **Verify [accessibility]** - ensure [specific features]
4. **Update documentation** if adding new features or changing behavior
```

### **9. Troubleshooting Common Issues**
```markdown
## 🐛 Troubleshooting Common Issues

### **[Common Issue 1]**
- **Symptoms**: [What to look for]
- **Solutions**: [How to fix]

### **[Common Issue 2]**
- **Symptoms**: [What to look for]
- **Solutions**: [How to fix]

### **[State Management Problems]**
- Don't modify [specific hooks/patterns]
- Ensure [specific functionality] works
- Check that [props/state] are passed correctly
```

### **10. Key Dependencies & Technologies**
```markdown
## 📚 Key Dependencies

### **[Framework/Library]**
```javascript
import [Component] from '[library]';
```

### **CSS Features Used**
- [CSS Grid/Flexbox] for layouts
- [CSS Custom Properties] for theming
- [Media queries] for responsive design
- [CSS transitions] for smooth animations
```

### **11. Best Practices for AI Agents**
```markdown
## 🎯 Best Practices for AI Agents

### **Code Quality**
- **Write clean, readable code** with clear variable names
- **Add comments** for complex logic
- **Follow [framework] patterns** - use [specific patterns]
- **Maintain consistency** with existing code style

### **User Experience**
- **Preserve smooth interactions** - don't break [specific animations]
- **Maintain fast loading** - don't add unnecessary complexity
- **Keep intuitive navigation** - don't change established user flows
- **Ensure accessibility** - maintain [specific accessibility features]

### **Documentation**
- **Update README.md** when adding new features
- **Add troubleshooting steps** to [specific files]
- **Document new components** with clear descriptions
- **Explain complex logic** with inline comments
```

### **12. Testing Checklist**
```markdown
## 🔍 Testing Checklist

Before considering changes complete:

- [ ] **[Specific functionality] loads correctly**
- [ ] **[Specific features] work as expected**
- [ ] **[Navigation/interactions] function properly**
- [ ] **All [specific elements] are clickable**
- [ ] **Responsive design works on mobile**
- [ ] **[Design system] is consistent**
- [ ] **No console errors**
- [ ] **[Accessibility features] preserved**
- [ ] **Documentation updated if needed**
```

### **13. Support & Resources**
```markdown
## 📞 Support & Resources

### **Key Files for Reference**
- `[specific-file].md` - [Purpose]
- `README.md` - [Purpose]
- `[data-file].js` - [Purpose]

### **Common Commands**
```bash
# [Command description]
[command]

# [Troubleshooting command]
[command]
```

---

**Remember**: This [repository type] represents [purpose]. All changes should maintain the [quality standards] and [specific requirements] that reflect [project goals].
```

## 🎯 Customization Instructions

### **Repository-Specific Customization**

1. **Replace Placeholders**: Update all `[bracketed placeholders]` with repository-specific information
2. **Add Repository Details**: Include specific technologies, frameworks, and patterns used
3. **Define Critical Rules**: Identify what should never be modified and what must always be preserved
4. **Include Examples**: Add real code examples from the repository
5. **Update File Paths**: Reference actual files and directories in the repository
6. **Add Specific Scenarios**: Include testing scenarios relevant to the repository's functionality

### **Key Areas to Customize**

- **Repository Overview**: Purpose, technologies, and main features
- **Architecture**: Component relationships and data flow
- **Design System**: Colors, spacing, and styling patterns
- **Critical Rules**: What must never be changed
- **Common Patterns**: Real code examples from the repository
- **Testing Scenarios**: Specific functionality to test
- **Troubleshooting**: Common issues and their solutions

### **Quality Checklist**

- [ ] All placeholders replaced with actual repository information
- [ ] Critical functionality clearly identified and protected
- [ ] Real code examples included
- [ ] Testing scenarios are specific and actionable
- [ ] Troubleshooting section covers common issues
- [ ] File paths and references are accurate
- [ ] Best practices align with repository standards

## 📝 Usage Instructions

1. **Copy the template structure** above
2. **Customize each section** with repository-specific information
3. **Add real examples** from the codebase
4. **Define clear constraints** for AI agents
5. **Include comprehensive testing checklist**
6. **Save as `AI-AGENTS.md`** in the repository root
7. **Update as the repository evolves**

This guide ensures AI agents understand the repository structure, follow best practices, and make safe, effective modifications while preserving the project's integrity and functionality.
