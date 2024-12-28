# Dotfiles - WIP

Personal OSX dotfiles

![image](https://raw.githubusercontent.com/phgeorgiev/dotfiles/refs/heads/master/screenshot.png)

## Install

For initial installation, run the following commands in the terminal.

```bash
xcode-select --install

git clone https://github.com/phgeorgiev/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```

Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.

### Local Git identity

```bash
git config -f ~/.gitlocal user.email "your email"
git config -f ~/.gitlocal user.name "Your Name"
```

## The `dotsync` command

Syncing dotfiles after the initial installation is done with the `dotsync` command.

```console
dotsync
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

## Credits

- [dotfiles community](http://dotfiles.github.io/)
- [Andrej Mihaliak](https://github.com/mihaliak/dotfiles)
- [Artem Sapegin](https://github.com/sapegin/dotfiles)
- [Jan Moesen](https://github.com/janmoesen/tilde)
