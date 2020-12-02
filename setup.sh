#!/bin/bash

# Gleefully stolen from: https://stackoverflow.com/a/246128
# DIR is the directory that contains this script - think of a better name for it 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo apt install -y zsh neovim tmux

mkdir -p ${HOME}/.config/tmux
mkdir -p ${HOME}/.config/nvim

if [ ! -f ${HOME}/.config/tmux/tmux.conf ]
then
    ln -s ${DIR}/tmux/.tmux.conf ${HOME}/.config/tmux/tmux.conf
fi

if [ ! -f ${HOME}/.zshrc ]
then
    ln -s ${DIR}/zsh/.zshrc ${HOME}/.zshrc
fi
if [ ! -f ${HOME}/.zshenv ]
then
    ln -s ${DIR}/zsh/.zshenv ${HOME}/.zshenv
fi

if [ ! -f ${HOME}/.config/nvim/init.vim ]
then
    ln -s ${DIR}/vim/.vim/init.vim ${HOME}/.config/nvim/init.vim
fi

sudo tic -xe alacritty,alacritty-direct ${DIR}/alacritty/alacritty.info

echo "ZSH is usually in /usr/bin/zsh setting shell to $(which zsh)"
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sh -c curl -fsSL https://starship.rs/install.sh | bash
