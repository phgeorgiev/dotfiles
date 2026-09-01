# Dotfiles - WIP

Personal OSX dotfiles

![image](https://raw.githubusercontent.com/phgeorgiev/dotfiles/refs/heads/master/screenshot.png)

## Install

For initial installation, run the following commands in the terminal.

```bash
xcode-select --install

git clone https://github.com/phgeorgiev/dotfiles.git ~/dotfiles
cd ~/dotfiles
./dot init
```

The `dot init` command will:

- Install Homebrew (if not already installed)
- Install packages from Brewfile using `brew bundle`
- Install Composer PHP dependency manager
- Install Claude Code CLI for AI-powered development
- Install and configure Zsh with oh-my-zsh and powerlevel10k theme
- Stow dotfiles (create symlinks to your home directory)
- Create a global symlink for the dot script in `/usr/local/bin`
- Set up tab completion for the dot command

## The `dot` command

After installation, you can use the `dot` command from anywhere to manage your dotfiles. The command includes tab completion for all commands and subcommands.

### Available commands

```console
dot help                    # Show help message
dot init                    # Initialize dotfiles setup
dot update                  # Update dotfiles and optionally upgrade packages
dot stow                    # Manage dotfiles with GNU stow
dot skills                  # Link repo-tracked skills into Claude's skills directory
dot link                    # Create global symlink for dot script
dot edit                    # Open the dotfiles repo in $VISUAL (or $EDITOR)
dot clean                   # Remove regenerable IDE and build caches
```

### Package management

```console
dot package add git vim     # Add packages to Brewfile and install them
dot package check           # Check installed vs missing packages from Brewfile
dot package sync            # Interactively install/remove packages to match Brewfile
dot package outdated        # Check for outdated packages from Brewfile
dot package remove git vim  # Remove packages from Brewfile and uninstall them
dot package update all      # Update all packages from Brewfile
dot package update git vim  # Update specific packages
dot package clean           # Remove packages not in Brewfile and cleanup cache
dot package link node       # Switch between package versions
dot package link list       # List available packages and versions
```

### Cache cleanup

JetBrains IDEs build a per-project cache for every worktree they open, keyed by
an opaque hash. Nothing removes those caches when the worktree is deleted, so
they accumulate indefinitely — the analyzer cache alone can reach double-digit
gigabytes.

`dot clean jetbrains` reads the project path recorded inside each cache, checks
whether that worktree still exists, and removes only the orphans.

```console
dot clean jetbrains            # Remove caches for deleted worktrees
dot clean jetbrains --dry-run  # Preview what would be removed
dot clean jetbrains --all      # Also remove caches for worktrees that still exist
dot clean jetbrains --yes      # Skip the confirmation prompt
```

Caches with no recorded project path are always left untouched. Worktrees are
read from `~/.herdr/worktrees`, override with `HERDR_WORKTREES_DIR`.

Quit your IDEs before cleaning — deleting a cache under a running IDE can
corrupt its state. Cleaned projects re-index on next open.

Cleanup runs automatically: a herdr plugin
(`home/.config/herdr/plugins/jetbrains-cache`) subscribes to the
`worktree.removed` event, so the sweep happens however the worktree goes away —
CLI, keybinding, or a click in the nav bar. Link it once with
`herdr plugin link ~/.config/herdr/plugins/jetbrains-cache`.

The hook uses `--yes`. Orphaned caches are removed even while an IDE is running —
their worktree is gone, so no open project can own them. Caches for live
worktrees (`--all`) are never touched unattended.

### Examples

```console
# Install a new package and add it to Brewfile
dot package add neovim

# Check which packages are installed vs missing from Brewfile
dot package check

# Check which packages from Brewfile have updates available
dot package outdated

# Remove a package and remove it from Brewfile
dot package remove vim

# Update all packages from Brewfile
dot package update all

# Update specific packages
dot package update git neovim

# Interactively sync packages with Brewfile (install missing, remove untracked)
dot package sync

# Clean up unused packages
dot package clean

# Switch to a specific package version
dot package link node@22

# Switch to latest version of a package
dot package link node

# List all available package versions
dot package link list

# Re-stow dotfiles after making changes
dot stow

# Make a newly added skill visible to Claude Code
dot skills

# Update dotfiles and optionally upgrade packages
dot update

# See which JetBrains caches belong to deleted worktrees
dot clean jetbrains --dry-run

# Reclaim space from those caches
dot clean jetbrains
```
