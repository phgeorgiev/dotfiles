if (( ! $+commands[dot] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `dot`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_dot" ]]; then
  typeset -g -A _comps
  autoload -Uz _dot
  _comps[dot]=_dot
fi

command cp "${0:h}/completions/_dot" "$ZSH_CACHE_DIR/completions/_dot"
