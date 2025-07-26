if (( ! $+commands[dot] )); then
  return
fi

# Add the plugin's completions directory to fpath
fpath=("${0:h}/completions" $fpath)

# Load the completion function
autoload -Uz _dot
compdef _dot dot
