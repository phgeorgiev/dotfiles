---
description: Create a git commit from the current changes
argument-hint: "[extra instructions]"
---

## 1. Gather changes

If the user said "stashed changes", run `git stash show -p stash@{0}` (or the index given) and skip to step 3.

Otherwise run in parallel:
```
git status
git diff --cached
git diff
git log --oneline <main-branch>..HEAD
```

## 2. Evaluate atomicity

A commit is atomic if it's:
- **One logical unit** — no "and" needed to describe it
- **Revertable alone** — reverting undoes exactly one thing
- **Self-contained** — codebase builds/works at this point in history
- **Rightly sized** — not multiple concerns bundled, not a fragment that only makes sense with another staged change

## 3. Write message(s)

Conventional Commits format: `<type>[optional scope]: <description>` (`!` after type for breaking changes).

| Type       | When to use                                       |
|------------|----------------------------------------------------|
| `feat`     | A new feature or capability                        |
| `fix`      | A bug fix                                          |
| `docs`     | Documentation only                                 |
| `style`    | Formatting, whitespace — no logic change           |
| `refactor` | Code restructuring with no feature or bug change   |
| `test`     | Adding or updating tests                           |
| `chore`    | Build process, tooling, config, dependencies, CI   |
| `perf`     | Performance improvement                            |
| `revert`   | Reverting a previous commit                        |

Omit scope by default — only add one when the repo has clearly distinct packages/apps and the scope narrows where to look. A skill or directory name is not a scope.

## 4. Output

One-line verdict:
- **GOOD** — atomic, ready to commit
- **SPLIT** — unrelated concerns, break apart
- **REGROUP** — staged/unstaged split is wrong

Then, as chat output (not commit body): brief why (2-4 sentences), any typos/issues spotted, and suggested message(s):
`"<conventional commit message>"` → stage: `<files>`

## 5. Commit

- Stage the relevant files and lines (`git add`) per the split.
- Create the commit. Default to title only (skip the body); add a body only when the title alone can't carry the why. No co-author trailer.

Do not push. Do not do anything else beyond staging and committing.
