# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Claude Code configuration repository** that contains organized prompt templates, workflow templates, and utility scripts for Claude Code CLI. It serves as a centralized configuration system for AI-assisted development across multiple projects.

## Architecture

The repository follows a configuration-as-code approach with these key components:

- **Prompt Templates**: Organized by category (contexts, tasks, system roles)
- **Workflow Templates**: Structured templates for common development scenarios
- **Utility Scripts**: Interactive tools for prompt selection and combination
- **Settings Management**: Global and project-specific configuration files

## Key Commands

### CLI Operations
```bash
# Start Claude Code
claude

# Initialize new project
/init

# View/modify configuration
/config

# Clear conversation history
/clear

# Show current file context
/files
```

### Utility Scripts
```bash
# Interactive prompt selector
~/.claude/utils/select-prompt.sh

# Combine multiple prompts
~/.claude/utils/load-prompt.sh contexts/python.md tasks/code-review.md

# Copy combined prompts to clipboard
~/.claude/utils/load-prompt.sh contexts/react.md tasks/refactor.md | pbcopy
```

### Recommended Aliases
```bash
alias cc='claude'
alias ccprompts='~/.claude/utils/select-prompt.sh'
alias gcr='git add . && claude -c "Review my staged changes"'
```

## Configuration System

### Global Configuration
- Location: `~/.claude/settings.json`
- Model: claude-sonnet-4-20250514
- Temperature: 0.1, Max Tokens: 4096
- Full permissions: Read, Write, Bash access

### Project-Specific Configuration
- Copy template: `~/.claude/templates/settings.local.json.template`
- Place in: `.claude/settings.json` (in project root)
- Supports environment variables and custom hooks

## Prompt Organization

### Contexts (`prompts/contexts/`)
Language and framework-specific guidance:
- Python, JavaScript, TypeScript, React, Go, etc.
- Use for language-specific development tasks

### Tasks (`prompts/tasks/`)
Specific development activities:
- Code review, debugging, testing, refactoring
- Documentation, optimization, security analysis

### System (`prompts/system/`)
Role-based prompts:
- Analyst, coder, reviewer, mentor roles
- Use to set specialized behavior patterns

## Workflow Templates

### Available Templates
- New feature development
- Bug investigation and fixing
- Code review processes
- Project setup and initialization

### Usage Pattern
1. Copy template content
2. Fill in project-specific details
3. Paste into Claude Code session
4. Follow guided implementation

## Development Patterns

### Code Review Workflow
1. Stage changes: `git add .`
2. Use template: `~/.claude/prompts/tasks/code-review.md`
3. Or direct command: "Review my staged changes"

### Debugging Workflow
1. Combine context + task: `~/.claude/utils/load-prompt.sh contexts/[language].md tasks/debug-help.md`
2. Include error messages and relevant code
3. Follow systematic debugging approach

### Feature Development
1. Use template: `~/.claude/templates/new-feature.md`
2. Define requirements and acceptance criteria
3. Implement incrementally with regular reviews

## Important Notes

- Always run `/init` in new projects to create project-specific CLAUDE.md
- Use `/clear` frequently to reset context for different tasks
- Combine context and task prompts for optimal results
- Project settings override global settings
- Hooks can automate post-processing (formatting, linting, etc.)

## File Structure Reference

```
~/.claude/
├── settings.json              # Global configuration
├── prompts/
│   ├── contexts/             # Language/framework contexts
│   ├── tasks/                # Development task templates
│   └── system/               # Role-based prompts
├── templates/                # Workflow templates
├── utils/                    # Interactive helper scripts
└── examples/                 # Usage documentation
```

This configuration system enables consistent, efficient AI-assisted development across multiple projects and team members.