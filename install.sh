#!/bin/bash

magenta='\033[35m'
yellow='\033[33m'
green='\033[32m'
clear='\033[0m'
stepCounter=1

outputSection() {
  echo -e "${magenta}======= ${1} =======${clear}"
}

outputStep() {
  echo -e "${green}${stepCounter}) ${yellow}${1}${clear}"
  stepCounter=$(( ${stepCounter} + 1 ))
}

updateLocalRepository() {
  pushd ${HOME}/.dotfiles &>/dev/null
  git pull origin master &>/dev/null
  popd &>/dev/null
}

checkForVundle() {
  if [ ! -d "${HOME}/.vim/bundle/vundle.vim" ]; then
    echo -e "Vundle not found. Installing...${clear}"
    git clone https://github.com/gmarik/vundle.vim.git ~/.vim/bundle/vundle.vim &>/dev/null
  else
    echo -e "Vundle found. Skipping...${clear}"
  fi
}

checkForUltiSnips() {
  if [ ! -d "${HOME}/.vim/UltiSnips" ]; then
    echo -e "UltiSnips symlink not found. Linking...${clear}"
    ln -s ~/.dotfiles/vim/UltiSnips ~/.vim
  else
    echo -e "UltiSnips symlink found. Skipping...${clear}"
  fi
}

outputSection "Installing dotfiles"

outputStep "Updating repository"
updateLocalRepository

outputStep "Symlinking ~/.vimrc"
rm -f ~/.vimrc
ln -s ~/.dotfiles/vimrc ~/.vimrc

outputStep "Checking for Vundle"
checkForVundle

outputStep "Cleaning old vundles"
vim +PluginClean! +qa

outputStep "Installing new vundles"
vim +PluginInstall +qa

outputStep "Updating old vundles"
vim +PluginUpdate +qa

outputStep "Checking for UltiSnips symlink"
checkForUltiSnips

outputSection "Installation complete"
