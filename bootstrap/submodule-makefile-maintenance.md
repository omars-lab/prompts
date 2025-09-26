# Submodule and Makefile Maintenance Guide

## Overview
This prompt provides comprehensive guidance for AI agents on how to properly maintain repositories that use git submodules, particularly when the repository has a root-level prompts directory as a submodule, and how to create or extend Makefiles to support submodule operations.

## Key Principles

### 1. Submodule Management
- **Never replace existing Makefiles**: Always extend existing Makefiles rather than replacing them
- **Preserve original targets**: Never alter or remove existing targets unless explicitly requested
- **Follow existing patterns**: Match the style and structure of the existing Makefile
- **Test all changes**: Always run `make help` after making changes to verify functionality

### 2. Repository Structure
When working with repositories that have a root-level prompts directory as a submodule:
- The prompts directory should be a git submodule pointing to an external repository
- Submodule reference changes must be committed in the parent repository
- Use `git add .` to properly stage submodule reference changes

## Common Submodule Issues and Solutions

### 1. Detached HEAD State
**Problem**: Submodules often end up in detached HEAD state after updates
**Cause**: `git submodule update --remote` checks out commits but doesn't switch to local branches
**Solution**: Create and switch to a local branch in the submodule

### 2. Recursive Push Not Working
**Problem**: `git push --recurse-submodules=on-demand` doesn't work
**Cause**: Recursive push only works when pushing actual commits, not uncommitted changes
**Solution**: Commit submodule reference changes first, then push

### 3. Submodule Status Not Visible
**Problem**: `git status` doesn't show submodule details by default
**Cause**: Git doesn't show submodule summary by default
**Solution**: Enable `status.submodulesummary` configuration

## Makefile Guidelines

### Required Targets for Submodule Support

#### 1. `update-prompts` Target
```makefile
update-prompts: ## Pull latest changes from the prompts submodule
	@echo "Updating prompts submodule..."
	git submodule update --remote prompts
	@echo "Prompts submodule updated successfully!"
```

#### 2. `enable-submodule-status` Target
```makefile
enable-submodule-status: ## Enable submodule status in git status output
	@if [ "$$(git config --get status.submodulesummary)" != "1" ]; then \
		echo "Enabling submodule status in git status..."; \
		git config status.submodulesummary 1; \
		echo "Submodule status enabled! Run 'git status' to see submodule details."; \
	else \
		echo "Submodule status is already enabled."; \
	fi
```

#### 3. `enable-recursive-push` Target
```makefile
enable-recursive-push: ## Enable recursive submodule pushes
	@if [ "$$(git config --get push.recurseSubmodules)" != "on-demand" ]; then \
		echo "Enabling recursive submodule pushes..."; \
		git config --global push.recurseSubmodules on-demand; \
		echo "Recursive submodule pushes enabled!"; \
	else \
		echo "Recursive submodule pushes are already enabled."; \
	fi
```

#### 4. `fix-submodule-detached-head` Target
```makefile
fix-submodule-detached-head: ## Fix detached HEAD in prompts submodule
	@echo "Fixing detached HEAD in prompts submodule..."
	cd prompts && git checkout -b main origin/main 2>/dev/null || git checkout main
	@echo "Submodule HEAD fixed!"
```

#### 5. `commit-submodule-updates` Target
```makefile
commit-submodule-updates: ## Commit submodule reference changes
	@echo "Committing submodule reference changes..."
	git add prompts
	@if [ -n "$$(git status --porcelain)" ]; then \
		git commit -m "Update prompts submodule"; \
		echo "Submodule updates committed successfully!"; \
	else \
		echo "No submodule changes to commit."; \
	fi
```

#### 6. `push-with-submodules` Target
```makefile
push-with-submodules: ## Push commits and submodules recursively
	@echo "Pushing commits and submodules..."
	git push --recurse-submodules=on-demand
	@echo "Push completed successfully!"
```

#### 7. Basic Commit and Push Targets
```makefile
commit: ## Stage and commit changes (interactive message)
	@echo "Staging all changes..."
	git add .
	@if [ -n "$$(git status --porcelain)" ]; then \
		echo "Enter commit message:"; \
		read -r commit_msg; \
		git commit -m "$$commit_msg"; \
		echo "Changes committed successfully!"; \
	else \
		echo "No changes to commit."; \
	fi

push: ## Push committed changes to remote
	@echo "Pushing to remote..."
	git push
	@echo "Changes pushed successfully!"

commit-push: commit push ## Commit and push changes (interactive message)
```

### Makefile Structure Requirements

#### Header Comment for Agents
```makefile
# AGENTS: Guidelines for maintaining this Makefile
# ================================================
# 
# When adding new targets:
# 1. Follow the pattern: target-name: ## Description of what the target does
# 2. Use .PHONY declarations for all targets that don't create files
# 3. Keep targets focused on single responsibilities
# 4. Use composable targets (e.g., target1 target2) for complex workflows
# 5. Always include a description after ## for the help target
# 6. Test new targets with 'make help' to ensure they appear correctly
# 7. ALWAYS run 'make help' after making any changes to verify the Makefile works
#
# CRITICAL: Indentation Rules
# - Commands under targets MUST be indented with TABS, not spaces
# - Use 'make -n <target>' to test syntax before running
# - If targets don't work, check indentation with: sed -n 'X,Yp' Makefile | cat -e
# - Replace spaces with tabs: sed -i '' 's/^    /\t/' Makefile
#
# Target naming conventions:
# - Use kebab-case for target names
# - Prefix with action: commit-, push-, update-, etc.
# - Use descriptive names that indicate the target's purpose
#
# Submodule considerations:
# - Always use 'git add .' to stage submodule reference changes
# - Submodule updates require committing the reference change in parent repo
# - Use 'git submodule update --remote <submodule>' to update submodules
#
# Example of good target structure:
# target-name: dependency1 dependency2 ## Clear description of what this does
# 	@echo "Starting action..."
# 	command1
# 	command2
# 	@echo "Action completed successfully!"

# All targets that don't create files should be declared as .PHONY
.PHONY: help install add init-site check audit clean start clear build serve version deploy fix-frontmatter upgrade update-prompts enable-submodule-status enable-recursive-push fix-submodule-detached-head commit-submodule-updates push-with-submodules commit push commit-push

# Standard Makefile Variables (include these in all Makefiles)
SHELL := /bin/bash
MAKEFILE_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
```

#### .PHONY Declarations
**IMPORTANT**: The .PHONY declaration should be placed immediately after the agent header comment and should include ALL targets from the Makefile (both existing and new ones). This ensures proper Make behavior and prevents conflicts with files of the same name.

```makefile
# All targets that don't create files should be declared as .PHONY
.PHONY: help install add init-site check audit clean start clear build serve version deploy fix-frontmatter upgrade update-prompts enable-submodule-status enable-recursive-push fix-submodule-detached-head commit-submodule-updates push-with-submodules commit push commit-push
```

#### Standard Variables
All Makefiles should include these standard variables for consistency and proper functionality:

```makefile
# Standard Makefile Variables (include these in all Makefiles)
SHELL := /bin/bash
MAKEFILE_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
```

**Variable Explanations:**
- `SHELL := /bin/bash` - Ensures consistent shell behavior across different systems
- `MAKEFILE_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))` - Provides the absolute path to the directory containing the Makefile, useful for relative path operations

**Additional Variables** (add as needed for your project):
```makefile
# Project-specific variables (examples from Docusaurus projects)
SITENAME := your-site-name
SITEROOT := ${MAKEFILE_DIR}/${SITENAME}
```

#### Help Target
```makefile
help: ## Show this help message
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
```

## Implementation Steps

### For New Repositories
1. **Add prompts submodule**:
   ```bash
   git submodule add git@github.com:omars-lab/prompts.git prompts
   ```

2. **Create Makefile** with all required targets and structure:
   - Include agent header comment
   - Add .PHONY declaration with ALL targets
   - Include standard variables (SHELL, MAKEFILE_DIR)
   - Add project-specific variables as needed
   - Include all required submodule targets
   - Add help target

3. **Test functionality**:
   ```bash
   make help
   make update-prompts
   make enable-submodule-status
   make enable-recursive-push
   ```

### For Existing Repositories with Makefiles
1. **Analyze existing Makefile**:
   - Read the current structure and patterns
   - Identify existing targets and their purposes
   - Note the coding style and conventions
   - Check for standard variables (SHELL, MAKEFILE_DIR)

2. **Extend, don't replace**:
   - Add new targets following existing patterns
   - Preserve all original targets
   - Match the existing style and formatting
   - Add standard variables if missing

3. **Add missing targets**:
   - Only add targets that don't already exist
   - Use similar naming conventions as existing targets
   - Follow the same indentation and formatting style

4. **Update .PHONY declarations**:
   - Move .PHONY declaration to immediately after agent header
   - Include ALL targets (existing + new) in .PHONY declaration
   - Maintain the existing format

5. **Test thoroughly**:
   ```bash
   make help  # Verify all targets appear correctly
   make <new-target>  # Test each new target
   ```

## Common Workflows

### Complete Submodule Update Workflow
```bash
# Update the submodule
make update-prompts

# Fix detached HEAD if needed
make fix-submodule-detached-head

# Commit the submodule reference change
make commit-submodule-updates

# Push everything recursively
make push-with-submodules
```

### General Development Workflow
```bash
# Make changes to files
# ...

# Commit with custom message
make commit-push

# Or commit and push separately
make commit
make push
```

### One-time Setup Workflow
```bash
# Enable submodule status visibility
make enable-submodule-status

# Enable recursive pushes globally
make enable-recursive-push
```

## Best Practices

### 1. Idempotent Targets
- Make targets safe to run multiple times
- Check current state before making changes
- Provide clear feedback about what was done

### 2. Error Handling
- Check if changes exist before committing
- Provide meaningful error messages
- Handle edge cases gracefully

### 3. User Experience
- Use clear, descriptive target names
- Provide helpful echo messages
- Make targets self-documenting through descriptions

### 4. Testing
- Always run `make help` after changes
- Test each new target individually
- Verify the help output shows all targets correctly

### 5. Makefile Syntax
- **CRITICAL**: Use tabs for indentation, not spaces
- Commands under targets must be indented with tabs
- Test with `make -n <target>` to check syntax
- If targets don't work, check indentation with: `sed -n 'X,Yp' Makefile | cat -e`
- Replace spaces with tabs: `sed -i '' 's/^    /\t/' Makefile`
- Always verify with `make help` after making changes

## Troubleshooting

### Common Issues
1. **Submodule not updating**: Ensure the submodule URL is correct and accessible
2. **Makefile syntax errors**: Check indentation (must use tabs, not spaces)
3. **Targets not appearing in help**: Verify the target has a `## Description` format
4. **PHONY declaration missing**: Add new targets to the .PHONY line
5. **Detached HEAD**: Use `fix-submodule-detached-head` target
6. **Recursive push not working**: Commit submodule changes first, then push
7. **Makefile targets not working**: Check for space/tab indentation issues

### Verification Commands
```bash
# Check Makefile syntax
make -n <target>

# Verify all targets
make help

# Check submodule status
git submodule status

# Check git configuration
git config --get status.submodulesummary
git config --get push.recurseSubmodules

# Debug Makefile indentation issues
sed -n 'X,Yp' Makefile | cat -e  # Check specific lines for tabs/spaces
sed -i '' 's/^    /\t/' Makefile  # Replace 4 spaces with tabs
make -f Makefile help  # Test with explicit file path

# Check submodule HEAD state
cd prompts && git status
```

### Debugging Submodule Issues
```bash
# Check submodule configuration
git config --file .gitmodules --list

# Check submodule remote
cd prompts && git remote -v

# Check submodule branch
cd prompts && git branch -a

# Check submodule commit
cd prompts && git log --oneline -3
```

## Summary

When working with repositories that have submodules and Makefiles:

1. **Always extend existing Makefiles** - never replace them
2. **Follow existing patterns** and conventions
3. **Add required submodule support targets** if missing
4. **Test all changes** with `make help`
5. **Use idempotent, user-friendly targets**
6. **Provide clear documentation** in target descriptions
7. **Handle common submodule issues** with dedicated targets
8. **Use proper Makefile syntax** (tabs for indentation)

This approach ensures consistency, maintainability, and a good user experience while preserving the existing functionality of the repository and handling all common submodule scenarios.
