#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
	${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# vim
ln -s ${BASEDIR}/_vimrc ~/.vimrc

# git
ln -s ${BASEDIR}/_gitconfig ~/.gitconfig

