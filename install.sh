#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$BASEDIR"

# zsh
mkdir -p ~/.oh-my-zsh/custom
cp -R zsh-custom/* ~/.oh-my-zsh/custom

# vim
cp -i _vimrc ~/.vimrc

# git
cp -i _gitconfig ~/.gitconfig

