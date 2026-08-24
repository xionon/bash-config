---
name: worktrunk-worktrees
description: Manage Git task worktrees consistently with Worktrunk (`wt`), including agent-prefixed branch names and safe cleanup after merge.
---

# Worktrunk worktrees

Use this skill for any task that creates, switches, merges, or removes a Git worktree. The goal is one predictable workflow shared by Claude, Codex, and Pi.

## Create task worktrees

- Inspect `git status --short --branch` and `wt list` before changing a repository. Preserve unrelated changes and active worktrees.
- Use `wt`, never `git worktree add`, to create or manage task worktrees.
- The shared user configuration places them under `~/worktrees/<repo>/<agent>-<task-slug>`; do not override that location per task.
- Create a new task branch with `wt switch --create <agent>/<task-slug>` from the intended base branch. Use one of `claude`, `codex`, or `pi` for `<agent>`.
- Make `<task-slug>` lowercase kebab-case, specific, and durable. Include a tracker number first when one exists: `codex/issue-78-model-cache`, `claude/ticket-74-requirements`, or `pi/fix-login-redirect`.
- Do not use opaque hash suffixes, generated codenames, timestamps, or agent-session IDs in branch names. Reuse an existing matching task branch/worktree instead of making a near-duplicate.
- Work from the directory selected by `wt`; do not manually create directories for worktrees. If a tool already placed the task in a worktree, keep using that checkout and still use `wt` for later merge or removal when possible.

## Finish and clean up

- Before integrating, review the diff and run the task-appropriate validation.
- When the user authorizes a local merge, run `wt merge [target]` from the task worktree. It rebases, merges, and removes the integrated worktree and branch by default. Do not pass `--no-remove` unless the user asks to retain it.
- When the merge happens through a pull request or another actor, confirm the branch is integrated with `wt list`, then run `wt remove --reap <branch>` to remove its worktree and delete the now-merged branch. `--reap` is appropriate only for the task's own detached dev processes.
- Never use `wt remove --force` or `--force-delete` merely to tidy up. Stop and report dirty or unmerged worktrees; only force removal with explicit user approval after naming the exact target and what would be discarded.
- Do not remove worktrees or branches belonging to another active task. `wt list` is the source of truth for cleanup candidates.

## Recover stale entries

If `wt list` reports a prunable worktree, inspect it first. Use `git worktree prune` only to clear metadata for a directory confirmed absent; do not delete a real directory to make the list clean.
