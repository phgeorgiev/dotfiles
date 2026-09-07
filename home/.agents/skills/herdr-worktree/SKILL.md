---
name: herdr-worktree
description: Create a task-focused Herdr git worktree, expose it in the Spaces navigator, and start an interactive coding agent there. Use when the user explicitly asks to start or create a Herdr worktree or space for a task.
compatibility: Requires an active Herdr-managed pane, the herdr CLI, and a git repository.
---

# Start a Herdr worktree

1. Verify the caller is inside Herdr:

   ```sh
   test "${HERDR_ENV:-}" = 1
   ```

   If this fails, explain that Herdr cannot be controlled from outside a Herdr-managed pane and stop.

2. Run `herdr --skill` and follow its current safety and control instructions. Treat the installed CLI and its help output as authoritative rather than relying on remembered syntax.

3. Resolve the launch inputs:
   - Repository: the current git repository unless the user named another.
   - Task: the user's requested focus, preserving every stated scope boundary.
   - Branch and label: use explicit values when supplied; otherwise derive concise kebab-case values from the task and inspect existing worktrees before choosing them.
   - Base: use the requested ref; otherwise use the current checkout's `HEAD`.
   - Agent kind: use the requested kind; otherwise use the caller's recognized kind, falling back to `pi`.

   Ask only when a missing or ambiguous input could create the worktree in the wrong repository or from the wrong base.

4. Inspect repository status, default branch/current HEAD, existing Herdr worktrees, and live agent names. A linked worktree starts from committed state; warn before continuing only when uncommitted changes appear necessary for the requested task.

5. Create a new linked worktree with `herdr worktree create`, passing the repository cwd, branch, base, label, and `--no-focus`. Parse the workspace, root pane, path, and branch from the JSON response. This workspace is what makes the task available in the Spaces navigator.

6. Start an agent in the returned root pane with a short, unique name. Keep the user's focus in the calling workspace.

7. Prompt the new agent with the task and its scope boundaries. Tell it to inspect before editing, make the focused change, run relevant checks, and ask before broadening an explicitly narrow scope. Submit without waiting for completion so the workspace remains immediately interactive.

8. After a brief delay, query the agent state. If startup or prompting is blocked, inspect the agent output and report the blocker without answering approval or question dialogs on the user's behalf.

9. Report the Space label, branch, worktree path, agent name, and current status. The workflow is complete when the linked workspace is visible in Herdr, its agent has received the task, and the user can interact with it from the Spaces navigator.
