# Claude Code Usage Examples

## Basic Usage
```bash
  # Start Claude Code in your project directory
  cd /path/to/your/project
  claude

  # In the Claude Code session:
  > /init
  > Help me refactor this function to be more readable
```

## Using Prompt Templates
```bash
  # Copy a prompt template to clipboard and paste into Claude
  cat ~/.claude/prompts/tasks/code-review.md

  # Or combine multiple prompts
  cat ~/.claude/prompts/contexts/python.md ~/.claude/prompts/tasks/debug-help.md
```

## Project-Specific Configuration
```bash
# Create project settings
echo '{
  "temperature": 0.0,
  "env": {
    "PROJECT_TYPE": "production"
  }
}' > .claude/settings.json
```

## File Context Loading
```bash
# Load specific files into context
> Can you review the auth.py file?

# Load directory context
> Analyze the entire src/ directory structure
```

## Git Integration
```bash
# In Claude Code session:
> Review my staged changes and suggest improvements
> Create a commit message for the current changes
> Help me resolve this merge conflict
```
