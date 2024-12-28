#!/bin/bash

green=$(tput setaf 2)
normal=$(tput sgr0)

# Make sure we’re using the latest Homebrew
brew update

title "Installing packages..."
brew install stow
brew install zsh
brew install zsh-syntax-highlighting
brew install tmux
brew install jq
brew install yq
brew install tree
brew install neofetch
brew install htop
brew install wget
brew install git
brew install git-extras
brew install git-delta
brew install gh
brew install lazygit
brew install node
brew install yarn
brew install wifi-password
brew install diff-so-fancy
brew install git-friendly/git-friendly/git-friendly
brew install go
brew install openjdk@21
brew install lazydocker
brew install maven
brew install php
brew install symfony-cli/tap/symfony-cli
brew install kubernetes-cli
brew install k9s
brew install minikube
brew install skaffold
brew install ghostty
echo
echo "${green}Success! Packages installed.${normal}"

# Wait a bit before moving on...
sleep 1

title "Installing cask packages..."
brew install --cask raycast
brew install --cask 1password
brew install --cask arc
brew install --cask slack
brew install --cask docker
brew install --cask quicklook-json
brew install --cask syntax-highlight
brew install --cask qlmarkdown
brew install --cask quicklook-csv
brew install --cask betterzip
brew install --cask istat-menus
brew install --cask insomnia
brew install --cask visual-studio-code
brew install --cask intellij-idea
brew install --cask phpstorm
brew install --cask tableplus
brew install --cask figma
brew install --cask firefox
brew install --cask discord
brew install --cask obsidian
brew install --cask logi-options-plus
brew install --cask font-jetbrains-mono-nerd-font

echo
echo "${green}Success! Cask packages installed.${normal}"
