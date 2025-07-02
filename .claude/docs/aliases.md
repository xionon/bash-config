# Useful Shell Aliases for Claude Code

Add these to your `~/.zshrc` or `~/.bashrc`:

```bash
# Claude Code shortcuts
alias cc='claude'
alias ccc='claude && /clear'
alias ccr='~/.claude/utils/load-prompt.sh contexts/react.md tasks/code-review.md'
alias ccp='~/.claude/utils/load-prompt.sh contexts/python.md tasks/debug-help.md'
alias ccinit='cd $(pwd) && claude -c "/init"'

# Prompt helpers
alias ccprompts='~/.claude/utils/select-prompt.sh'
alias ccload='~/.claude/utils/load-prompt.sh'
```

## Git Integration Aliases
```bash
# Git + Claude workflows
alias gcr='git add . && claude -c "Review my staged changes"'
alias gcm='git add . && claude -c "Create a commit message for these changes"'
```

After adding aliases, reload your shell:
```bash
source ~/.zshrc  # or ~/.bashrc
```
