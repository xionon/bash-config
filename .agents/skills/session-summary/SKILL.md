---
name: session-summary
description: Generate a structured session summary, update the improvements backlog, or review trends across past summaries. Use `review` as the argument to analyze trends instead of summarizing the current session.
---

# Session Summary

All files live in `~/.agents/session-summaries/` (a shared location used by all agents, not just Claude Code):

- `<project-slug>/<YYYY-MM-DD>_<slug>.md` — individual summaries. `<project-slug>` is the working directory basename (e.g. `dagster`); `<slug>` is a 2-4 word kebab-case description of the session.
- `INDEX.md` — one line per summary, newest first. Format: `- YYYY-MM-DD [title](project/file.md) — outcome one-liner (friction: tag1, tag2)`
- `IMPROVEMENTS.md` — the running backlog of process improvements. This is the file that makes tracking over time possible. Never delete entries; change their status instead.

## Mode selection

If invoked with the argument `review`, run **Review mode**. Otherwise run **Summarize mode**.

## Summarize mode

**Step 1 — Read context first.** Before writing anything, read `IMPROVEMENTS.md` and the 3 most recent entries in `INDEX.md` (follow the links if useful). You need these to (a) check whether previously proposed improvements were actually applied this session, and (b) notice recurring friction.

**Step 2 — Write the summary file** with this structure:

```markdown
---
date: YYYY-MM-DD
project: <project-slug>
branch: <git branch, if in a repo>
title: <short human title>
outcome: shipped | partial | blocked | exploratory
turns: <approx user-message count>
duration: <approx wall-clock, if inferable>
cost: <session cost if available, else "unknown">
friction-tags: [tag1, tag2]   # e.g. flaky-tests, unclear-requirements, permission-prompts, tool-misuse, rework, slow-ci
---

## TL;DR
2-3 sentences: what was asked, what happened, where it ended.

## What shipped
Concrete artifacts: files changed, PRs, commits, decisions made. Link paths.

## What went well
Specific things worth repeating (not generic praise).

## Friction log
Each item: what happened, roughly how much time/turns it cost, and its
friction-tag. Be honest — this section is the raw data for the review mode.

## Improvement follow-through
For each `proposed` or `adopted` item in IMPROVEMENTS.md that was relevant
this session: was it applied? Did it help? One line each. Skip irrelevant ones.

## New improvement proposals
Only improvements that are concrete and actionable (a CLAUDE.md edit, a hook,
a skill change, a workflow habit). No vague "communicate better" items.

## Open threads
Unfinished work or follow-ups for the next session.
```

Base metrics on the actual conversation; if cost/duration aren't knowable, say "unknown" rather than guessing.

**Step 3 — Update `IMPROVEMENTS.md`.** Each entry has a stable ID and a status line:

```markdown
## IMP-014: Run `make ruff` before claiming task complete
- status: proposed | trialing | adopted | dropped
- proposed: YYYY-MM-DD (session link)
- last-seen: YYYY-MM-DD — one-line note on how it went
```

Add new proposals from this session, and update `last-seen` + status on any item you evaluated in the follow-through section. Promote `trialing` → `adopted` after it has helped in 2+ sessions; mark `dropped` (with a reason) rather than deleting.

**Step 4 — Prepend a line to `INDEX.md`** for this summary.

**Step 5 — Report back** to the user: the TL;DR, the file path, any recurring friction (same tag in 2+ recent sessions), and the status changes you made to the backlog.

## Review mode (`/session-summary review`)

Read `INDEX.md`, `IMPROVEMENTS.md`, and all summaries from the last 30 days (or the last 10, whichever is more). Report:

1. **Friction trends** — which friction-tags recur, and whether they're getting better or worse.
2. **Improvement scorecard** — each backlog item's status and trajectory; call out `proposed` items that keep being ignored (either adopt or drop them).
3. **Metrics over time** — outcome mix (shipped/partial/blocked), rough cost/turns trends if the data exists.
4. **Top 3 recommendations** — the highest-leverage changes, each with the concrete edit to make (CLAUDE.md line, hook, skill change).

Suggest running review mode roughly every 5-10 summaries; note in the report how many summaries have accumulated since the last review (record reviews as entries in INDEX.md prefixed with `[review]`).
