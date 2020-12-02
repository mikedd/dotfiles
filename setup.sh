#!/bin/bash

# Gleefully stolen from: https://stackoverflow.com/a/246128
# DIR is the directory that contains this script - think of a better name for it 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo apt install -y zsh neovim tmux

mkdir -p ${HOME}/.config/tmux
mkdir -p ${HOME}/.config/nvim

ln -s ${DIR}/tmux/.tmux.conf ${HOME}/.config/tmux/tmux.conf

ln -s ${DIR}/zsh/.zshrc ${HOME}/.zshrc
ln -s ${DIR}/zsh/.zshenv ${HOME}/.zshenv

ln -s ${DIR}/vim/.vim/init.vim ${HOME}/.config/nvim/init.vim


sudo tic -xs alacritty,alacritty-direct ${DIR}/alacritty/alacritty.info
