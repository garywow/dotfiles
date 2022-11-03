#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIME=$( date -u )

echo install packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y zsh vim dos2unix wget \
                    git gh build-essential \
                    fzf silversearcher-ag

# broot
echo install broot
cd ~
[[ -f broot ]] && rm -f broot
wget https://dystroy.org/broot/download/x86_64-linux/broot && chmod +x broot; sudo mv broot /usr/local/bin

# oh-my-zsh and powerlevel10k
echo install oh-my-zsh and powerlevel10k
[[ -d ~/.oh-my-zsh ]] && rm -fr ~/.oh-my-zsh
RUNZSH=no sh -c "$(wget -q -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

[[ -d ~/powerlevel10k ]] && rm -fr ~/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

sed -i --posix -E 's/^ZSH_THEME=".+"$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i --posix -E 's/^plugins=\((.+)\)$/plugins=(\1 vi-mode fzf)/' ~/.zshrc
sed -i --posix -E 's/^# export LANG=.+$/export LANG=en_US.UTF-8/' ~/.zshrc
sed -i --posix -E '/^# Preferred editor/a\export EDITOR=vim' ~/.zshrc

# zsh custom
echo install ~/.oh-my-zsh/custom/
cp -f -R "${BASEDIR}/zsh-custom/*" ~/.oh-my-zsh/custom

# vimrc
[[ -f ~/.vimrc ]] && cp -f ~/.vimrc ~/.vimrc-${TIME} && rm ~/.vimrc
echo install ~/.vimrc
cp -f "${BASEDIR}/_vimrc" ~/.vimrc

# gitconfig
[[ -f ~/.gitconfig ]] && cp -f ~/.gitconfig ~/.gitconfig-${TIME} && rm ~/.vimrc
echo install ~/.gitconfig
cp -f "${BASEDIR}/_gitconfig" ~/.gitconfig

# git flow
echo install git flow
cd ~
[[ -f gitflow-installer.sh ]] && rm -f gitflow-installer.sh
wget https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && sudo bash gitflow-installer.sh install stable; rm gitflow-installer.sh && rm -fr gitflow
