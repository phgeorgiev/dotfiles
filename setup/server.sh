#!/bin/bash

# Configures Apache (macOS), PHP (macOS) and MySQL (Homebrew).

# Require Homebrew
command -v brew >/dev/null 2>&1 || { echo >&2 "Please install Homebrew first."; exit 1; }

# Ask for the administrator password upfront
sudo -v

# MySQL
brew install mysql
unset TMPDIR
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
mysql.server start
/usr/local/opt/mysql/bin/mysqladmin -u root password 'root'

# PHP
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

brew unlink php70
brew install php71

# Install VM
brew cask install vagrant
brew cask install virtualbox
