# Dotfiles - WIP

Personal OSX dotfiles

![iTerm2.app](https://raw.githubusercontent.com/phgeorgiev/dotfiles/master/screenshot.png)

## Install

```bash
xcode-select --install

git clone https://github.com/phgeorgiev/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
./bin/dotsync link
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```

Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.

### Local Git identity

```bash
git config -f ~/.gitlocal user.email "your email"
git config -f ~/.gitlocal user.name "Your Name"
```

## Install iTerm color scheme

- Launch iTerm
- Import `Default.json` from `~/dotfiles/iterm` folder

## The `dotsync` command

```console
$ dotsync help
Usage: dotsync <command>

Commands:
    help             This help message
    link             Link dot files from dots folder to ~
    update           Update packages
    clean            Clean up caches
```

## Credits

- [dotfiles community](http://dotfiles.github.io/)
- [Andrej Mihaliak](https://github.com/mihaliak/dotfiles)
- [Artem Sapegin](https://github.com/sapegin/dotfiles)
- [Jan Moesen](https://github.com/janmoesen/tilde)
