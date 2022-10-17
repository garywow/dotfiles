#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$BASEDIR"

# zsh
echo install ~/.oh-my-zsh/custom/
mkdir -p ~/.oh-my-zsh/custom
cp -R zsh-custom/* ~/.oh-my-zsh/custom

# vim
if [ ! -f ~/.vimrc ]; then
    echo install ~/.vimrc
    cp _vimrc ~/.vimrc
else
    echo ~/.vimrc already exists
fi

# git
if [ ! -f ~/.gitconfig ]; then
    echo install ~/.gitconfig
    cp _gitconfig ~/.gitconfig
else
    echo ~/.gitconfig already exists
fi

cp setup-devenv.sh ~
cp setup-devenv-go.sh ~

chmod +x ~/setup-devenv.sh
chmod +x ~/setup-devenv-go.sh
