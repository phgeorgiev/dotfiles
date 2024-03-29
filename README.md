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
tmux source ~/.tmux.conf
```

### Local Git identity

```bash
git config -f ~/.gitlocal user.email "your email"
git config -f ~/.gitlocal user.name "Your Name"
```

## Install iTerm color scheme

- Launch iTerm
- Type CMD+i
- Navigate to Colors tab
- Click on Load Presets
- Click on Import
- Select the .itermcolors file located in `iterm` folder
- Click on Load Presets and choose a color scheme

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
