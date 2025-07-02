Alec's Dotfiles
===============

This repository contains my dotfiles managed with [yadm](https://yadm.io/).

## Installation

1. Install yadm:
   ```bash
   # macOS
   brew install yadm
   
   # Ubuntu/Debian
   sudo apt install yadm
   
   # Or install manually
   curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
   ```

2. Clone this repository:
   ```bash
   yadm clone https://github.com/xionon/bash-config.git
   ```

3. The bootstrap script will automatically run and set up:
   - Git configuration  
   - Vim with vim-plug
   - Neovim with lazy.nvim plugin manager
   - Platform-specific packages

## Manual Setup

If the bootstrap doesn't run automatically:
```bash
yadm bootstrap
```

## What's Included

- **Vim**: Classic vim configuration with vim-plug
- **Neovim**: Modern nvim config with lazy.nvim, LSP, Telescope, and more
- **Git**: Global git configuration and ignore patterns
- **Shell**: ackrc, gemrc, and other dotfiles

## Theme

Make sure to import `Tomorrow Night.itermcolors` into iTerm2 on macOS.
Check https://github.com/ChrisKempson/Tomorrow-Theme for other applications.

## Usage

```bash
yadm status                    # Check status
yadm add <file>               # Track new dotfiles  
yadm commit -m "message"      # Commit changes
yadm push                     # Push to remote
```
