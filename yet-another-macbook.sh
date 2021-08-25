#!/bin/bash

# This is a script for when I need to re-setup a new macbook for a new job. Or when the job gets new laptops.
# Or when I get a new device.
# Feel free to modify and use it.

sudo echo "testing sudo here"

# Disables mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Executables: VSCode, Chrome, Brave browser, iTerm2
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask iterm2

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git config --global user.name "Ed 'Flamingo' Putans"
git config --global user.email "edputans@gmail.com"
git config --global push.default current

# Generates an SSH key and copies the public one to the clipboard (to set up new SSH key in github)
yes "" "" "" |  ssh-keygen -t ed25519 -C "edputans@gmail.com"
pbcopy < ~/.ssh/id_ed25519.pub
brew install node

# Coding related shit: Homebrew, npm, node, eslint, create-react-app, yarn, oh_my_zsh
brew install yarn
yarn install --g create-react-app
yarn install --g eslint
yarn install --g typescript

# a bunch of VSCode extensions for convenient frontend dev (git lens, bracket colorizer, etc)
code --install-extension dbaeumer.vscode-eslint 
code --install-extension esbenp.prettier-vscode
code --install-extension coenraads.bracket-pair-colorizer
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension rvest.vs-code-prettier-eslint
code --install-extension eamodio.gitlens-insiders
code --install-extension adamcaviness.theme-monokai-dark-soda
code --install-extension eg2.vscode-npm-script
code --install-extension christian-kohler.path-intellisense
code --install-extension ms-vsliveshare.vsliveshare

# Adds a bunch of aliases I frequently use
echo '' >> .zshrc
echo 'alias gpull="git pull"' >> .zshrc
echo 'alias gagcm="git add . && git commit -m"' >> .zshrc
echo 'alias gpush="git push"' >> .zshrc
echo '' >> .zshrc
echo 'alias edit="code ~/.zshrc"' >> .zshrc
echo 'alias history="code ~/.zsh_history"' >> .zshrc
echo 'alias list="ls -cl --group-directories-first"' >> .zshrc

# Install nvm:
brew install nvm
mkdir ~/.nvm
echo 'export NVM_DIR=~/.nvm' >> ~/.zshrc
echo 'source $(brew --prefix nvm)/nvm.sh' >> ~/.zshrc

# install messaging
brew install --cask telegram-desktop
brew install --cask slack
