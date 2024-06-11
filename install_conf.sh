#!/usr/bin/env bash

mkdir -p ~/.vim/pack/gruvbox/start/
git clone --depth 1 https://github.com/morhetz/gruvbox.git ~/.vim/pack/gruvbox/start/gruvbox

wget https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.vimrc ~/
wget https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.tmux.conf ~/
