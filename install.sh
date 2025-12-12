#!/bin/bash

# Configuration
# -------------
# Author: Dasa Elayavilli Ponnappan
# Description: Interactive installer for Gemini Workflows

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Header
echo -e "${BLUE}=================================================${NC}"
echo -e "${BLUE}      Gemini Workflows Interactive Installer     ${NC}"
echo -e "${BLUE}=================================================${NC}"
echo -e "Author: Dasa Elayavilli Ponnappan (dasa@manizh.com)\n"

# 1. Target Directory Prompt
# --------------------------
DEFAULT_DIR=".agent/workflows"
read -p "Enter target installation directory [Default: $DEFAULT_DIR]: " TARGET_DIR
TARGET_DIR=${TARGET_DIR:-$DEFAULT_DIR}

echo -e "\n${BLUE}[INFO]${NC} Installing to: ${YELLOW}$TARGET_DIR${NC}"

# Check if target exists, create if not
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}[WARN]${NC} Directory does not exist. Creating it..."
    mkdir -p "$TARGET_DIR"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[OK]${NC} Created $TARGET_DIR"
    else
        echo -e "${RED}[ERR]${NC} Failed to create directory. Check permissions."
        exit 1
    fi
else
    echo -e "${GREEN}[OK]${NC} Directory exists."
fi

# 2. Copy Workflows
# -----------------
echo -e "\n${BLUE}--- Copying Workflow Files ---${NC}"

# List of files to exclude from copy (installer scripts themselves, etc.)
EXCLUDES="install.sh|install.bat|README.md|SETUP.md"

# Count files copied
COUNT=0

for file in *; do
    if [[ ! "$file" =~ $EXCLUDES ]] && [ -f "$file" ]; then
        cp "$file" "$TARGET_DIR/"
        echo -e "  ${GREEN}✔${NC} Copied $file"
        ((COUNT++))
    fi
done

echo -e "${GREEN}[SUCCESS]${NC} Copied $COUNT workflow files.\n"

# 3. Environment Check
# --------------------
echo -e "${BLUE}--- Environment Check ---${NC}"

# Look for .env in the parent of the target dir (project root assumption)
PROJECT_ROOT=$(dirname "$TARGET_DIR")
if [ "$PROJECT_ROOT" = "." ]; then
    PROJECT_ROOT="."
fi
ENV_FILE="$PROJECT_ROOT/.env"

if [ -f "$ENV_FILE" ]; then
    echo -e "${GREEN}[OK]${NC} Found .env file at $ENV_FILE"
else
    echo -e "${RED}[MISSING]${NC} No .env file found at $PROJECT_ROOT"
    read -p "Do you want to create a template .env file? (y/n): " CREATE_ENV
    if [[ "$CREATE_ENV" =~ ^[Yy]$ ]]; then
        touch "$ENV_FILE"
        echo -e "${GREEN}[OK]${NC} Created empty .env file."
    else
        echo -e "${YELLOW}[SKIP]${NC} Skipping .env creation."
    fi
fi

# 4. API Key Check
# ----------------
if [ -f "$ENV_FILE" ]; then
    echo -e "\n${BLUE}--- Checking API Keys ---${NC}"
    
    KEYS=("ANTHROPIC_API_KEY" "OPENAI_API_KEY" "GOOGLE_API_KEY")
    MISSING_KEYS=()

    for key in "${KEYS[@]}"; do
        if grep -q "^$key=" "$ENV_FILE"; then
             # Check if value is not empty
             val=$(grep "^$key=" "$ENV_FILE" | cut -d '=' -f2)
             if [ -z "$val" ]; then
                 echo -e "${YELLOW}[WARN]${NC} $key is present but EMPTY."
                 MISSING_KEYS+=("$key")
             else
                 echo -e "${GREEN}[OK]${NC} $key found."
             fi
        else
            echo -e "${RED}[MISSING]${NC} $key is missing."
            MISSING_KEYS+=("$key")
        fi
    done

    if [ ${#MISSING_KEYS[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}Some keys are missing or empty.${NC}"
        read -p "Would you like to append placeholders for them? (y/n): " APPEND_KEYS
        if [[ "$APPEND_KEYS" =~ ^[Yy]$ ]]; then
            echo "" >> "$ENV_FILE"
            echo "# Added by Gemini Workflows Installer" >> "$ENV_FILE"
            for key in "${MISSING_KEYS[@]}"; do
                echo "$key=" >> "$ENV_FILE"
                echo -e "${GREEN}[ADDED]${NC} $key placeholder added to .env"
            done
            echo -e "\n${YELLOW}[ACTION REQUIRED]${NC} Please open $ENV_FILE and fill in the API keys."
        fi
    else
        echo -e "\n${GREEN}[PERFECT]${NC} All required API keys are present!"
    fi
fi

# Footer
echo -e "\n${BLUE}=================================================${NC}"
echo -e "${GREEN}      Installation Complete! 🚀      ${NC}"
echo -e "${BLUE}=================================================${NC}"
echo -e "You can now use the workflows in your AI IDE."

echo -e "\n${BLUE}--- 💡 Usage Examples ---${NC}"
echo -e "${YELLOW}1. Backend Development:${NC}  @agent_backend_expert \"Design a User API\""
echo -e "${YELLOW}2. Frontend Development:${NC} @agent_frontend_expert \"Refactor the Dashboard\""
echo -e "${YELLOW}3. Security Audit:${NC}       @agent_audit_expert \"Audit the auth module\""
echo -e "${YELLOW}4. Infrastructure:${NC}       @agent_infrastructure_expert \"Optimise GKE cost\""
echo -e "${YELLOW}5. Jira Ticket:${NC}          @create_jira_ticket \"Bug: Fix login crash\""

echo -e "\n${BLUE}💡 Pro Tip: Chain them for E2E flow!${NC}"
echo -e "   ${GREEN}Code${NC} (@agent_backend_expert) -> ${GREEN}Audit${NC} (@agent_audit_expert) -> ${GREEN}Deploy${NC} (@backend_deploy)"


