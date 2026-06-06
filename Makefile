ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
CURRENT_USER:=$(shell whoami)

# Determine the correct NotePlan directory based on current user
ifeq ($(CURRENT_USER),omareid)
	NOTEPLAN_PROMPTS_DIR := '/Users/omareid/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Notes/📝 Prompts'
else ifeq ($(CURRENT_USER),oeid)
	NOTEPLAN_PROMPTS_DIR := '/Users/oeid/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Notes/📝 Prompts'
else
	NOTEPLAN_PROMPTS_DIR := '/Users/$(CURRENT_USER)/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Notes/📝 Prompts'
endif

# Copy prompts from NotePlan to root of this project
copy-from-noteplan:
	@echo "Copying prompts from NotePlan to root of this project"
	@SOURCE_DIR="/Users/$(CURRENT_USER)/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Notes/📝 Prompts"; \
	echo "Source directory: $$SOURCE_DIR"; \
	echo "Target directory: $(ROOT_DIR)"; \
	if [ ! -d "$$SOURCE_DIR" ]; then \
		echo "Error: NotePlan Prompts directory does not exist: $$SOURCE_DIR"; \
		echo "Please ensure NotePlan is installed and the 📝 Prompts directory exists"; \
		exit 1; \
	fi; \
	echo "Using rsync to copy markdown files from NotePlan..."; \
	rsync -av --include="*/" --include="*.md" --exclude="*" "$$SOURCE_DIR/" "$(ROOT_DIR)/"; \
	echo "✅ Prompts copied successfully to project root!"

# Sync folders recursively to NotePlan prompts directory
sync-to-noteplan:
	@echo "Syncing organize folder to NotePlan prompts directory"
	@TARGET_DIR="/Users/$(CURRENT_USER)/Library/Containers/co.noteplan.NotePlan3/Data/Library/Application Support/co.noteplan.NotePlan3/Notes/📝 Prompts"; \
	echo "Source directory: $(ROOT_DIR)/organize"; \
	echo "Target directory: $$TARGET_DIR/organize"; \
	if [ ! -d "$(ROOT_DIR)/organize" ]; then \
		echo "Error: organize directory does not exist in project root"; \
		exit 1; \
	fi; \
	if [ ! -d "$$TARGET_DIR" ]; then \
		echo "Error: NotePlan Prompts directory does not exist: $$TARGET_DIR"; \
		echo "Please ensure NotePlan is installed and the 📝 Prompts directory exists"; \
		exit 1; \
	fi; \
	echo "Using rsync to sync organize folder..."; \
	rsync -av --delete "$(ROOT_DIR)/organize/" "$$TARGET_DIR/organize/"; \
	echo "✅ Organize folder synced successfully to NotePlan!"

# Point git at .githooks/ so the secret-scanning hooks are active (run once per clone)
setup-hooks:
	@git config core.hooksPath .githooks
	@chmod +x .githooks/* 2>/dev/null || true
	@echo "✓ git core.hooksPath → .githooks (pre-commit + pre-push: secret scan)"

# Scan the whole repo for leaked secrets (gitleaks)
secret-scan:
	@command -v gitleaks >/dev/null 2>&1 || { echo "gitleaks not installed — brew install gitleaks"; exit 1; }
	gitleaks detect --source . --redact --verbose

# Scan only staged changes for secrets (pre-commit style)
secret-scan-staged:
	@command -v gitleaks >/dev/null 2>&1 || { echo "gitleaks not installed — brew install gitleaks"; exit 1; }
	gitleaks protect --staged --redact --verbose

# Show help
help:
	@echo "Available targets:"
	@echo "  copy-from-noteplan      - Copy all .md files from NotePlan 📝 Prompts to project root"
	@echo "  sync-to-noteplan - Sync organize folder recursively to NotePlan 📝 Prompts"
	@echo "  setup-hooks            - Activate secret-scanning git hooks (run once)"
	@echo "  secret-scan            - Scan whole repo for leaked secrets"
	@echo "  secret-scan-staged     - Scan staged changes for secrets"
	@echo "  help                   - Show this help message"
	@echo ""
	@echo "Configuration:"
	@echo "  Current user: $(CURRENT_USER)"
	@echo "  Project root directory: $(ROOT_DIR)"

.PHONY: copy-from-noteplan sync-to-noteplan setup-hooks secret-scan secret-scan-staged help
