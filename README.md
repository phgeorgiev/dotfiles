# Dotfiles - WIP
OSX dotfiles

## Install

```bash
xcode-select --install

git clone https://github.com/phgeorgiev/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
dotsync.py
```

## The `dotfiles` command

```console
$ dotfiles help
Usage: dotfiles <command>

Commands:
    help             This help message
    update           Update packages and pkg managers (brew, composer)
    clean            Clean up caches (brew, composer)
```


## Credits

 - [dotfiles community](http://dotfiles.github.io/)
 - [Andrej Mihaliak](https://github.com/mihaliak/dotfiles)
 - [Artem Sapegin](https://github.com/sapegin/dotfiles)
 - [Jan Moesen
 ](https://github.com/janmoesen/tilde)