#!/bin/bash

# Install brew
if test ! $(which brew); then
    title "Installing Homebrew..."
    $dry_run /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew
$dry_run brew update

# Upgrade any already-installed formulae
$dry_run brew upgrade --all

title "Installing packages..."
$dry_run brew install htop
$dry_run brew install wget
$dry_run brew install git
$dry_run brew install git-extras
$dry_run brew install gh
$dry_run brew install gitui
$dry_run brew install yarn
$dry_run brew install wifi-password
$dry_run brew install zsh
$dry_run brew install gitui

echo
echo "${green}Success! software installed.${normal}"

# Waith a bit before moving on...
sleep 1

title "Installing cask packages..."
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
$dry_run brew install --cask --appdir="/Applications" iterm2
$dry_run brew install --cask --appdir="/Applications" 1password
$dry_run brew install --cask --appdir="/Applications" figma

echo
echo "${green}Success! software installed.${normal}"