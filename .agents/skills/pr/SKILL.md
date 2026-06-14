---
name: pr
description: Prepare pull requests in this repository. Use when an agent needs to create, update, review, title, summarize, or ready a pull request, especially when focusing a branch before merge or writing final-state PR text.
---

# Pull Request

Use this workflow for pull request preparation.

## Focus

Focus every pull request before merge so the branch represents the final intended state.

Remove dead code, temporary commits, outdated notes, and unrelated edits before opening or updating the pull request.

## Verify

Before opening, updating, or marking ready, run:

```sh
bazel build //...
bazel test //...
```

Do not mark a pull request ready with known failing builds or tests. If verification cannot run, explain the exact blocker.

## Title

Use a conventional title when practical:

```text
type(scope): description
```

Use these types: `build`, `chore`, `ci`, `docs`, `feat`, `fix`, `perf`, `refactor`, `revert`, `style`, `test`.

Prefer scopes that are one word.

## Body

Write the body from the final content of the branch.

Include context only when it helps review the resulting change.

Do not describe the sequence of attempts that produced the branch.
