#!/bin/bash
# Helper script to combine and display prompts

if [ $# -eq 0 ]; then
    echo "Usage: $0 <prompt-file> [additional-prompt-files...]"
    echo "Example: $0 contexts/python.md tasks/code-review.md"
    echo ""
    echo "Available contexts:"
    ls ~/.claude/prompts/contexts/ 2>/dev/null | sed 's/^/  /'
    echo ""
    echo "Available tasks:"
    ls ~/.claude/prompts/tasks/ 2>/dev/null | sed 's/^/  /'
    exit 1
fi

CLAUDE_DIR="$HOME/.claude"
COMBINED_PROMPT=""

for prompt_file in "$@"; do
    if [ -f "$CLAUDE_DIR/prompts/$prompt_file" ]; then
        COMBINED_PROMPT="$COMBINED_PROMPT\n\n$(cat "$CLAUDE_DIR/prompts/$prompt_file")"
    elif [ -f "$CLAUDE_DIR/templates/$prompt_file" ]; then
        COMBINED_PROMPT="$COMBINED_PROMPT\n\n$(cat "$CLAUDE_DIR/templates/$prompt_file")"
    else
        echo "Warning: File not found: $prompt_file" >&2
    fi
done

echo -e "$COMBINED_PROMPT"
