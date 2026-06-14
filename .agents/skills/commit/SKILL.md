---
name: commit
description: Prepare, verify, write, amend, and push Git commits in this repository. Use when an agent needs to commit changes, amend commits, pull updates, rebase, force-push safely, install or respect Git hooks, or write conventional commit messages.
---

# Commit

Use this workflow for commits, pulls, rebases, pushes, and force-pushes.

## Pull

Use rebase only:

```sh
git pull --rebase
```

Do not merge remote changes unless the user explicitly requests a merge commit.

## Verify

Before every commit and push, run:

```sh
bazel build //...
bazel test //...
```

Do not commit or push known failing builds or tests. If verification cannot run, explain the exact blocker.

## Message

Use conventional commits.

Use a single-line message for a simple change:

```text
type(scope): description
```

Use a body only when multiple distinct changes need context.

Write the title and body from the final content of the change. Do not mention iteration, review progression, temporary states, or implementation history.

Use these types: `build`, `chore`, `ci`, `docs`, `feat`, `fix`, `perf`, `refactor`, `revert`, `style`, `test`.

Prefer scopes that are one word.

## Push

Use a normal push for new commits.

When the user asks to replace existing remote history, use:

```sh
git push --force-with-lease
```

## Hooks

Install hooks with:

```sh
bazel run //system/git:install
```

Respect `commit-msg`, `pre-commit`, `pre-push`, and `pre-rebase`.
