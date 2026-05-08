---
name: commit-me
description: Evaluate uncommitted (or stashed) changes against atomic commit principles, then give a verdict with suggested commit message(s) following Conventional Commits.
---

## 1. Determine scope

Check whether the user said **"stashed changes"** (or similar) in their message.

- **Stashed changes**: run `git stash show -p stash@{0}` (or the stash index they specified). Skip steps that inspect the working tree.
- **Uncommitted changes** (default): proceed with steps 2–3 below.

## 2. Gather the changes

Run all of these in parallel:

```
git diff --cached --stat
git diff --cached
git diff --stat
git diff
git status
```

Also identify the main branch and run:
```
git log --oneline <main-branch>..HEAD
```

## 3. Evaluate against atomic commit rules

Apply these rules — derived from the Single Responsibility Principle extended to Git:

**One logical unit**
A commit should document exactly one complete unit of work. If you need "and" to describe all the changes, it's probably two commits.

**Revertable without side effects**
Reverting the commit should undo exactly one thing — no unrelated regressions, no collateral damage. If reverting it would also undo legitimate unrelated changes, it's not atomic.

**Self-contained**
The codebase must compile and work at this exact point in history. No broken imports, no missing dependencies introduced by a companion commit that isn't staged yet.

**Meaningful message**
You must be able to write a single, clear commit message that accurately covers all the changes — nothing more, nothing less.

**Right size**
Not too large (multiple concerns bundled together), not artificially small (a one-liner that only makes sense alongside another staged change).

## 4. Conventional Commits format

When suggesting commit messages, follow the [Conventional Commits](https://www.conventionalcommits.org/) spec:

```
<type>[optional scope]: <description>
```

Pick the type that best fits the change:

| Type       | When to use                                                    |
|------------|----------------------------------------------------------------|
| `feat`     | A new feature or capability                                    |
| `fix`      | A bug fix                                                      |
| `docs`     | Documentation only                                             |
| `style`    | Formatting, whitespace — no logic change                       |
| `refactor` | Code restructuring with no feature or bug change               |
| `test`     | Adding or updating tests                                       |
| `chore`    | Build process, tooling, config, dependencies, CI               |
| `perf`     | Performance improvement                                        |
| `revert`   | Reverting a previous commit                                    |

Omit the scope by default — prefer `feat: ...` over `feat(dot): ...`. Only add a scope when the repo has clearly distinct top-level packages or apps and the scope meaningfully narrows where to look (e.g. a monorepo with `apps/web` and `apps/api`). In a single-package or dotfiles repo, scope adds noise without value.

Add `!` after the type for breaking changes: `feat!: ...`

## 5. Output

Give a verdict on one line:

- **GOOD** — atomic, ready to commit
- **SPLIT** — multiple unrelated concerns, should be broken apart
- **REGROUP** — staged/unstaged split is wrong; some things should move in or out of the staging area

Follow with:
- A short explanation (2–4 sentences max) of why
- Typos or obvious issues spotted (e.g. wrong path in `.gitignore`)
- Suggested commit message(s) — one per proposed atomic commit, in the format:
  `"<conventional commit message>"` → stage: `<files>`
