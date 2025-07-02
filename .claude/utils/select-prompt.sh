#!/bin/bash
# Interactive prompt selector

CLAUDE_DIR="$HOME/.claude"

echo "Select prompt type:"
echo "1) System prompts"
echo "2) Task templates"
echo "3) Context prompts"
echo "4) Project templates"

read -p "Enter choice (1-4): " choice

case $choice in
    1)
        echo "Available system prompts:"
        ls "$CLAUDE_DIR/prompts/system/" | nl
        read -p "Select number: " num
        file=$(ls "$CLAUDE_DIR/prompts/system/" | sed -n "${num}p")
        cat "$CLAUDE_DIR/prompts/system/$file"
        ;;
    2)
        echo "Available task templates:"
        ls "$CLAUDE_DIR/prompts/tasks/" | nl
        read -p "Select number: " num
        file=$(ls "$CLAUDE_DIR/prompts/tasks/" | sed -n "${num}p")
        cat "$CLAUDE_DIR/prompts/tasks/$file"
        ;;
    3)
        echo "Available context prompts:"
        ls "$CLAUDE_DIR/prompts/contexts/" | nl
        read -p "Select number: " num
        file=$(ls "$CLAUDE_DIR/prompts/contexts/" | sed -n "${num}p")
        cat "$CLAUDE_DIR/prompts/contexts/$file"
        ;;
    4)
        echo "Available project templates:"
        ls "$CLAUDE_DIR/templates/" | nl
        read -p "Select number: " num
        file=$(ls "$CLAUDE_DIR/templates/" | sed -n "${num}p")
        cat "$CLAUDE_DIR/templates/$file"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac
