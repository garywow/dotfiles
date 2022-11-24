#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIME=$( date +%F_%R:%S)

install_packages () {
    echo ""
    echo "-----------------------------------------------"
    echo install packages
    echo ""

    APT_BIN=$( which apt &> /dev/null )
    DNF_BIN=$( which dnf &> /dev/null )

    if [ -n "$APT_BIN" ]; then
        sudo apt update -y
        sudo apt upgrade -y
        sudo apt install -y man zsh vim dos2unix curl wget htop tree \
            git gh build-essential \
            python3 python3-pip \
            fzf silversearcher-ag || exit
    fi

    if [ -n "$DNF_BIN" ]; then
        echo Not implemented yet
    fi

    # broot
    echo install broot
    cd ~
    [[ -f broot ]] && rm -f broot
    wget https://dystroy.org/broot/download/x86_64-linux/broot && \
        chmod +x broot && \
        sudo mv broot /usr/local/bin || exit
}

install_packages || exit

# oh-my-zsh and powerlevel10k
echo ""
echo "-----------------------------------------------"
echo install oh-my-zsh and powerlevel10k
echo ""
[[ -d ~/.oh-my-zsh ]] && rm -fr ~/.oh-my-zsh
[[ -f ~/oh-my-zsh-install.sh ]] && rm ~/oh-my-zsh-install.sh
wget -O ~/oh-my-zsh-install.sh \
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh || exit
[[ -f ~/oh-my-zsh-install.sh ]] || exit
RUNZSH=no sh ~/oh-my-zsh-install.sh -y || exit
rm ~/oh-my-zsh-install.sh

[[ -d ~/powerlevel10k ]] && rm -fr ~/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ~/.oh-my-zsh/custom/themes/powerlevel10k || exit
echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

sed -i --posix -E 's/^ZSH_THEME=".+"$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i --posix -E 's/^plugins=\((.+)\)$/plugins=(\1 vi-mode fzf)/' ~/.zshrc
sed -i --posix -E 's/^# export LANG=.+$/export LANG=en_US.UTF-8/' ~/.zshrc
sed -i --posix -E '/^# Preferred editor/a\export EDITOR=vim' ~/.zshrc

# zsh custom
echo ""
echo "-----------------------------------------------"
echo install ~/.oh-my-zsh/custom/
echo ""
cp -f -R "${BASEDIR}/zsh-custom"/* ~/.oh-my-zsh/custom

# vimrc
echo ""
echo "-----------------------------------------------"
echo install ~/.vimrc
echo ""
if [[ -f ~/.vimrc ]]; then
    VIMRC_BACKUP=".vimrc.${TIME}"
    cp -f ~/.vimrc ~/"${VIMRC_BACKUP}"
    diff ~/.vimrc ~/"${VIMRC_BACKUP}"
fi
cp -f "${BASEDIR}/_vimrc" ~/.vimrc

# gitconfig
echo ""
echo "-----------------------------------------------"
echo install ~/.gitconfig
echo ""
if [[ -f ~/.gitconfig ]]; then
    GITCONFIG_BACKUP=".gitconfig.${TIME}"
    cp -f ~/.gitconfig ~/"${GITCONFIG_BACKUP}"
    diff ~/.gitconfig ~/"${GITCONFIG_BACKUP}"
fi
cp -f "${BASEDIR}/_gitconfig" ~/.gitconfig

# git flow
echo ""
echo "-----------------------------------------------"
echo install git flow
echo ""
cd ~
[[ -f gitflow-installer.sh ]] && rm -f gitflow-installer.sh
wget -q https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh || exit
sudo bash gitflow-installer.sh install stable > /dev/null && \
    rm gitflow-installer.sh && \
    sudo rm -fr gitflow

# done
echo ""
echo done.
echo ""
