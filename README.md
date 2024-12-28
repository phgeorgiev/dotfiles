# Dotfiles - WIP

Personal OSX dotfiles

![iTerm2.app](https://raw.githubusercontent.com/phgeorgiev/dotfiles/master/screenshot.png)

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

## Credits

- [dotfiles community](http://dotfiles.github.io/)
- [Andrej Mihaliak](https://github.com/mihaliak/dotfiles)
- [Artem Sapegin](https://github.com/sapegin/dotfiles)
- [Jan Moesen](https://github.com/janmoesen/tilde)
