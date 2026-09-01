---
name: deep-review
description: Run a fixed-point code review with an additional concrete bug and history pass. Use for "deep review" or "invariant review". Invoke as `/skill:deep-review <commit|branch|tag>`.
---

Load and follow the `code-review` skill using the fixed point passed to this skill. If no fixed point was supplied, ask for one.

Then inspect the same `<fixed-point>...HEAD` diff specifically for concrete bugs and relevant git/PR history. Report only findings introduced by the diff, with `file:line` evidence.
