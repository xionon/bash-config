# Claude Code Configuration Directory

This directory contains configuration files and prompt templates for Claude Code.

## Directory Structure

```
~/.claude/
├── settings.json            # Global Claude Code settings
├── settings.local.json      # Local/personal settings
├── prompts/
│   ├── system/              # System prompts for different roles
│   ├── tasks/               # Task-specific templates
│   └── contexts/            # Language/framework contexts
├── templates/               # Project workflow templates
├── examples/                # Usage examples
├── utils/                   # Helper scripts
└── docs/                    # Reference documentation
```

## Quick Start

### Basic Usage
```bash
# Navigate to your project
cd /path/to/your/project

# Start Claude Code
claude

# In the Claude Code session:
/init                        # Create CLAUDE.md for your project
/config                      # View/modify settings
```

### Using Prompt Templates
```bash
# View available prompts
~/.claude/utils/select-prompt.sh

# Combine prompts
~/.claude/utils/load-prompt.sh contexts/python.md tasks/code-review.md

# Copy output to clipboard (macOS)
~/.claude/utils/load-prompt.sh contexts/react.md tasks/refactor.md | pbcopy
```

### Configuration
Claude Code uses `settings.json` for configuration:

**Global settings**: `~/.claude/settings.json`
**Project settings**: `.claude/settings.json` (copy from template)
**Local settings**: `.claude/settings.local.json` (copy from template)

### Common Workflows

#### Code Review
1. Stage your changes: `git add .`
2. In Claude Code: `Review my staged changes`
3. Or use template: Copy content from `~/.claude/prompts/tasks/code-review.md`

#### Debugging
1. Copy error message and relevant code
2. Use template: `~/.claude/prompts/tasks/debug-help.md`
3. Fill in the template and paste into Claude Code

#### New Feature
1. Use template: `~/.claude/templates/new-feature.md`
2. Fill in requirements and approach
3. Let Claude Code help implement step by step

## Customization

### Adding New Prompts
```bash
  # New system prompt
  cat > ~/.claude/prompts/system/my-role.md << 'EOF'
  You are a [role description]...
  EOF

  # New task template
  cat > ~/.claude/prompts/tasks/my-task.md << 'EOF'
  Help me with [task description]:
  ...
  EOF
```

### Project-Specific Settings
```bash
# In your project directory, copy the template
mkdir -p .claude
cp ~/.claude/templates/settings.local.json.template .claude/settings.json

# Edit as needed
echo '{
  "temperature": 0.0,
  "env": {
    "PROJECT_TYPE": "production"
  }
}' > .claude/settings.json
```

### Hooks and Automation
Add hooks to `settings.json`:
```json
{
  "hooks": {
    "afterWrite": [
      "echo 'File modified'",
      "npm run format"
    ]
  }
}
```

## Available Slash Commands

- `/init` - Create CLAUDE.md file
- `/clear` - Clear conversation history
- `/config` - Modify settings
- `/files` - Show current file context
- `/allowed-tools` - Configure permissions
- `/mcp` - Check MCP server status
- `/bug` - Report issues to Anthropic

## Best Practices

1. **Use `/clear` frequently** - Start fresh for different tasks
2. **Initialize projects** - Always run `/init` in new projects
3. **Provide context** - Use context prompts for language-specific help
4. **Be specific** - Clear, detailed prompts get better results
5. **Version control** - Commit useful `.claude/settings.json` for team sharing
6. **Use templates** - Consistent prompt templates improve results

## Troubleshooting

- **Settings not loading**: Check JSON syntax in settings files
- **Permissions denied**: Review `permissions` in settings.json
- **Context too large**: Use `/clear` to reset conversation
- **Files not found**: Ensure you're in the correct directory

## Helper Scripts

- `~/.claude/utils/load-prompt.sh` - Combine multiple prompts
- `~/.claude/utils/select-prompt.sh` - Interactive prompt selector

Both scripts are executable and can be run from anywhere.

Happy coding! 🎉
