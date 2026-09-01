#!/bin/sh
# Invoked by herdr on worktree.removed. The IDE keys its caches by path and
# never notices the path is gone, so sweep the orphans it left behind.
set -eu

if command -v dot >/dev/null 2>&1; then
    exec dot clean jetbrains --yes
fi

for candidate in "${HOME}/dotfiles/dot" /usr/local/bin/dot; do
    if [ -x "$candidate" ]; then
        exec "$candidate" clean jetbrains --yes
    fi
done

echo "sweep: 'dot' not found on PATH" >&2
exit 1
