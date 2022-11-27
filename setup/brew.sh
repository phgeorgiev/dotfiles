#!/bin/bash

# Install brew
if test ! $(which brew); then
    title "Installing Homebrew..."
    $dry_run /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if test ! $(which brew); then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# Make sure we’re using the latest Homebrew
$dry_run brew update

# Upgrade any already-installed formulae
$dry_run brew upgrade --all

title "Installing packages..."
$dry_run brew install tree
$dry_run brew install htop
$dry_run brew install wget
$dry_run brew install git
$dry_run brew install git-extras
$dry_run brew install gh
$dry_run brew install gitui
$dry_run brew install node@18
$dry_run brew install wifi-password
$dry_run brew install zsh
$dry_run brew install zsh-syntax-highlighting
$dry_run brew install diff-so-fancy
$dry_run brew install git-friendly/git-friendly/git-friendly
$dry_run brew install go@1.19
$dry_run brew install openjdk@17

echo
echo "${green}Success! Packages installed.${normal}"

# Waith a bit before moving on...
sleep 1

title "Installing cask packages..."
$dry_run brew install --cask --appdir="/Applications" google-chrome
$dry_run brew install --cask --appdir="/Applications" quicklook-json
$dry_run brew install --cask --appdir="/Applications" syntax-highlight
$dry_run brew install --cask --appdir="/Applications" qlmarkdown
$dry_run brew install --cask --appdir="/Applications" quicklook-csv
$dry_run brew install --cask --appdir="/Applications" betterzip
$dry_run brew install --cask --appdir="/Applications" istat-menus
$dry_run brew install --cask --appdir="/Applications" docker
$dry_run brew install --cask --appdir="/Applications" slack
$dry_run brew install --cask --appdir="/Applications" insomnia
$dry_run brew install --cask --appdir="/Applications" sequel-ace
$dry_run brew install --cask --appdir="/Applications" visual-studio-code
$dry_run brew install --cask --appdir="/Applications" intellij-idea
$dry_run brew install --cask --appdir="/Applications" iterm2
$dry_run brew install --cask --appdir="/Applications" 1password
$dry_run brew install --cask --appdir="/Applications" figma
$dry_run brew install --cask --appdir="/Applications" notion
$dry_run brew install --cask --appdir="/Applications" fleet

echo
echo "${green}Success! Cask packages installed.${normal}"