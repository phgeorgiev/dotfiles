#!/bin/bash

# Make sure we’re using the latest Homebrew
$dry_run brew update

# Upgrade any already-installed formulae
$dry_run brew upgrade --all

title "Installing packages..."
$dry_run brew install tree
$dry_run brew install neofetch
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
$dry_run brew install openjdk
$dry_run brew install maven
$dry_run brew install yarn
$dry_run brew install tmux
$dry_run brew install php@8.2
$dry_run brew install symfony-cli/tap/symfony-cli
$dry_run brew install kubernetes-cli
$dry_run brew install k9s
$dry_run brew install minikube
echo
echo "${green}Success! Packages installed.${normal}"

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
$dry_run brew install --cask --appdir="/Applications" hoppscotch
$dry_run brew install --cask --appdir="/Applications" sequel-ace
$dry_run brew install --cask --appdir="/Applications" visual-studio-code
$dry_run brew install --cask --appdir="/Applications" intellij-idea
$dry_run brew install --cask --appdir="/Applications" phpstorm
$dry_run brew install --cask --appdir="/Applications" webstorm
$dry_run brew install --cask --appdir="/Applications" iterm2
$dry_run brew install --cask --appdir="/Applications" 1password
$dry_run brew install --cask --appdir="/Applications" figma
$dry_run brew install --cask --appdir="/Applications" firefox
$dry_run brew install --cask --appdir="/Applications" sourcetree
$dry_run brew install --cask --appdir="/Applications" discord
$dry_run brew install --cask --appdir="/Applications" obsidian
$dry_run brew install --cask --appdir="/Applications" microsoft-teams
$dry_run brew install --cask --appdir="/Applications" spotify
$dry_run brew install --cask --appdir="/Applications" logi-options-plus

echo
echo "${green}Success! Cask packages installed.${normal}"