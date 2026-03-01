#!/bin/bash
#
# AV Design Engineering Skill Installer
# Cross-platform installation script for agent skills
#
# Usage:
#   ./install.sh                    # Auto-detect platform
#   ./install.sh --platform claude  # Install for Claude Code
#   ./install.sh --platform cursor  # Install for Cursor
#   ./install.sh --dry-run          # Show what would be done
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Skill name
SKILL_NAME="av-design-engineering-skill"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Parse arguments
PLATFORM=""
DRY_RUN=false
PROJECT_LEVEL=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --platform)
            PLATFORM="$2"
            shift 2
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --project)
            PROJECT_LEVEL=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --platform PLATFORM  Target platform (claude, cursor, copilot, windsurf, cline, codex, gemini)"
            echo "  --project            Install at project level instead of user level"
            echo "  --dry-run            Show what would be done without making changes"
            echo "  --help, -h           Show this help message"
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            exit 1
            ;;
    esac
done

# Detect platform if not specified
detect_platform() {
    if [[ -n "$PLATFORM" ]]; then
        return
    fi

    # Check for Claude Code
    if [[ -d "$HOME/.claude" ]]; then
        PLATFORM="claude"
        return
    fi

    # Check for Cursor (project level)
    if [[ -d ".cursor" ]]; then
        PLATFORM="cursor"
        PROJECT_LEVEL=true
        return
    fi

    # Check for Cursor (user level)
    if [[ -d "$HOME/.cursor" ]]; then
        PLATFORM="cursor"
        return
    fi

    # Check for GitHub Copilot
    if [[ -d ".github" ]]; then
        PLATFORM="copilot"
        PROJECT_LEVEL=true
        return
    fi

    # Check for Windsurf
    if [[ -d ".windsurf" ]]; then
        PLATFORM="windsurf"
        PROJECT_LEVEL=true
        return
    fi

    # Check for Cline
    if [[ -d ".clinerules" ]]; then
        PLATFORM="cline"
        PROJECT_LEVEL=true
        return
    fi

    # Check for Codex CLI
    if [[ -d ".codex" ]]; then
        PLATFORM="codex"
        PROJECT_LEVEL=true
        return
    fi

    # Check for Gemini CLI
    if [[ -d ".gemini" ]]; then
        PLATFORM="gemini"
        PROJECT_LEVEL=true
        return
    fi

    # Default to Claude Code
    PLATFORM="claude"
}

# Get install path based on platform
get_install_path() {
    local base_path=""

    case "$PLATFORM" in
        claude)
            if [[ "$PROJECT_LEVEL" == true ]]; then
                base_path=".claude/skills"
            else
                base_path="$HOME/.claude/skills"
            fi
            ;;
        cursor)
            if [[ "$PROJECT_LEVEL" == true ]]; then
                base_path=".cursor/rules"
            else
                base_path="$HOME/.cursor/rules"
            fi
            ;;
        copilot)
            if [[ "$PROJECT_LEVEL" == true ]]; then
                base_path=".github/skills"
            else
                echo -e "${RED}GitHub Copilot requires project-level installation${NC}"
                exit 1
            fi
            ;;
        windsurf)
            if [[ "$PROJECT_LEVEL" == true ]]; then
                base_path=".windsurf/skills"
            else
                base_path="$HOME/.windsurf/skills"
            fi
            ;;
        cline)
            if [[ "$PROJECT_LEVEL" == true ]]; then
                base_path=".clinerules"
            else
                base_path="$HOME/.clinerules"
            fi
            ;;
        codex)
            if [[ "$PROJECT_LEVEL" == true ]]; then
                base_path=".codex/skills"
            else
                base_path="$HOME/.codex/skills"
            fi
            ;;
        gemini)
            if [[ "$PROJECT_LEVEL" == true ]]; then
                base_path=".gemini/skills"
            else
                base_path="$HOME/.gemini/skills"
            fi
            ;;
        *)
            echo -e "${RED}Unknown platform: $PLATFORM${NC}"
            exit 1
            ;;
    esac

    echo "$base_path/$SKILL_NAME"
}

# Main installation
main() {
    detect_platform

    INSTALL_PATH=$(get_install_path)
    INSTALL_DIR=$(dirname "$INSTALL_PATH")

    echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║     AV Design Engineering Skill Installer                    ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "Platform:     ${GREEN}$PLATFORM${NC}"
    echo -e "Install Type: ${GREEN}$([ "$PROJECT_LEVEL" == true ] && echo "Project-level" || echo "User-level")${NC}"
    echo -e "Target Path:  ${GREEN}$INSTALL_PATH${NC}"
    echo -e "Dry Run:      ${YELLOW}$DRY_RUN${NC}"
    echo ""

    if [[ "$DRY_RUN" == true ]]; then
        echo -e "${YELLOW}Dry run - showing what would be done:${NC}"
        echo "  1. Create directory: $INSTALL_DIR"
        echo "  2. Copy skill to: $INSTALL_PATH"
        echo ""
        echo "To perform actual installation, run without --dry-run"
        exit 0
    fi

    # Create target directory
    if [[ ! -d "$INSTALL_DIR" ]]; then
        echo -e "${BLUE}Creating directory: $INSTALL_DIR${NC}"
        mkdir -p "$INSTALL_DIR"
    fi

    # Remove existing installation if present
    if [[ -d "$INSTALL_PATH" ]]; then
        echo -e "${YELLOW}Removing existing installation...${NC}"
        rm -rf "$INSTALL_PATH"
    fi

    # Copy skill to target location
    echo -e "${BLUE}Installing skill...${NC}"
    cp -R "$SCRIPT_DIR" "$INSTALL_PATH"

    # Make sure install script is executable in target
    chmod +x "$INSTALL_PATH/install.sh"

    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  Installation Complete!                                      ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "Skill installed to: ${GREEN}$INSTALL_PATH${NC}"
    echo ""
    echo -e "${BLUE}To use the skill:${NC}"
    echo ""
    echo -e "  1. Start a new session with your AI assistant"
    echo -e "  2. Type: ${GREEN}/av-design-engineering-skill${NC}"
    echo ""
    echo -e "${BLUE}Example usage:${NC}"
    echo ""
    echo -e "  ${GREEN}/av-design-engineering-skill Design a lecture hall for 150 seats with HyFlex${NC}"
    echo -e "  ${GREEN}/av-design-engineering-skill Create an AV system for a 40-seat classroom${NC}"
    echo ""
}

main
