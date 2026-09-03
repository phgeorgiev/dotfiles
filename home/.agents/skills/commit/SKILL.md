---
name: commit
description: Inspect repository changes, decide atomic Conventional Commits, and stage and commit them when the user asks to commit or write a commit message.
---

## 1. Gather changes

If the user specifies stashed changes, run `git stash show -p stash@{N}` for the specified index (default `0`) and continue at step 3. Do not stage or commit a stash unless the user explicitly asks to apply it.

Otherwise, determine the repository main branch (prefer the `origin/HEAD` target; fall back to `main`, then `master`) and run these in parallel:

```sh
git status
git diff --cached
git diff
git log --oneline <main-branch>..HEAD
```

## 2. Evaluate atomicity

An atomic commit is one logical, independently revertible, self-contained, rightly sized change. It needs no “and” to describe it, still leaves the codebase working at that history point, and is neither several concerns bundled nor a fragment that needs another staged change.

Classify the result:

- `GOOD` — atomic and ready to commit.
- `SPLIT` — unrelated concerns need separate commits.
- `REGROUP` — the staged and unstaged split is wrong.

## 3. Write message(s)

Use Conventional Commits: `<type>[optional scope]: <imperative summary>`, with `!` after the type or scope for breaking changes. Keep the summary terse, exact, imperative, without a trailing period; target 50 characters and never exceed 72.

Use `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, or `revert`. Use `build` or `ci` only when the repository convention distinguishes them from `chore`.

Omit scope unless clearly distinct packages or apps make it useful to narrow where to look. A skill or directory name alone is not a scope. Use a body only when the title cannot carry the why; always add one for breaking changes, security fixes, data migrations, and reverts. Wrap body lines at 72 characters, use `-` bullets, and include `BREAKING CHANGE:` where applicable. Never add AI attribution or a co-author trailer.

## 4. Output

Before making changes, provide:

1. The one-line verdict: `GOOD`, `SPLIT`, or `REGROUP`.
2. Two to four sentences explaining the decision and noting any typos or issues.
3. Suggested commit messages, one per commit, formatted as:
   `"<conventional commit message>" → stage: <files>`

## 5. Wait for acceptance, then commit

After step 4, wait for the author to explicitly accept the proposed commit plan. Do not stage or commit before that acceptance, including when the initial request asks to commit.

Once accepted, stage only the relevant files and lines for each atomic commit, then create the commit(s). Default to a title-only commit; add a body only when required above. Do not push or do work beyond staging and committing.
