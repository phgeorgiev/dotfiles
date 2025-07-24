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
- Stow dotfiles (create symlinks to your home directory)
- Create a global symlink for the dot script in `/usr/local/bin`

Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.

### Local Git identity

```bash
git config -f ~/.gitlocal user.email "your email"
git config -f ~/.gitlocal user.name "Your Name"
```

## The `dot` command

After installation, you can use the `dot` command from anywhere to manage your dotfiles.

### Available commands

```console
dot help                    # Show help message
dot init                    # Initialize dotfiles setup
dot stow                    # Manage dotfiles with GNU stow
dot link                    # Create global symlink for dot script
```

### Package management

```console
dot package add git vim     # Add packages to Brewfile and install them
dot package remove git vim  # Remove packages from Brewfile and uninstall them
dot package clean           # Remove packages not in Brewfile and cleanup cache
```

### Examples

```console
# Install a new package and add it to Brewfile
dot package add neovim

# Remove a package and remove it from Brewfile
dot package remove vim

# Clean up unused packages
dot package clean

# Re-stow dotfiles after making changes
dot stow
```

## The `bps` command

Switch between multiple package versions with the `bps` command.

example:

```console
bps

Usage: bps [command]

Brew package version switcher

Available command:
  list        list available packages and versions
  <package>   switch package to given version
              <package>[@<version>]
              Example:
              php     switching to latest available php version
              php@8.3 switching to php 8.3

Available packages:
  openjdk     23.0.1
  openjdk@17  17.0.13
  openjdk@21  21.0.5
  php         8.4.2
  php@8.3     8.3.15
  node        23.5.0
  node@22     22.12.0
```
