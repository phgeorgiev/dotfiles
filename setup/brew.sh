#!/bin/bash

# Make sure we’re using the latest Homebrew
$dry_run brew update

# Upgrade any already-installed formulae
$dry_run brew upgrade --all

$dry_run brew tap homebrew/cask-fonts

title "Installing packages..."
$dry_run brew install zsh
$dry_run brew install zsh-syntax-highlighting
$dry_run brew install tmux
$dry_run brew install yq
$dry_run brew install tree
$dry_run brew install neofetch
$dry_run brew install htop
$dry_run brew install wget
$dry_run brew install git
$dry_run brew install git-extras
$dry_run brew install git-delta
$dry_run brew install gh
$dry_run brew install lazygit
$dry_run brew install node
$dry_run brew install yarn
$dry_run brew install wifi-password
$dry_run brew install diff-so-fancy
$dry_run brew install git-friendly/git-friendly/git-friendly
$dry_run brew install go
$dry_run brew install openjdk@21
$dry_run brew install lazydocker
$dry_run brew install maven
$dry_run brew install php
$dry_run brew install symfony-cli/tap/symfony-cli
$dry_run brew install kubernetes-cli
$dry_run brew install k9s
$dry_run brew install minikube
$dry_run brew install skaffold
echo
echo "${green}Success! Packages installed.${normal}"

# Waith a bit before moving on...
sleep 1

title "Installing cask packages..."
$dry_run brew install --cask 1password
$dry_run brew install --cask arc
$dry_run brew install --cask raycast
$dry_run brew install --cask slack
$dry_run brew install --cask iterm2
$dry_run brew install --cask font-jetbrains-mono-nerd-font
$dry_run brew install --cask docker
$dry_run brew install --cask quicklook-json
$dry_run brew install --cask syntax-highlight
$dry_run brew install --cask qlmarkdown
$dry_run brew install --cask quicklook-csv
$dry_run brew install --cask betterzip
$dry_run brew install --cask istat-menus
$dry_run brew install --cask insomnia
$dry_run brew install --cask visual-studio-code
$dry_run brew install --cask intellij-idea
$dry_run brew install --cask phpstorm
$dry_run brew install --cask tableplus
$dry_run brew install --cask figma
$dry_run brew install --cask firefox
$dry_run brew install --cask discord
$dry_run brew install --cask obsidian
$dry_run brew install --cask logi-options-plus

echo
echo "${green}Success! Cask packages installed.${normal}"
