#!/usr/bin/env bash

mkdir -p ~/.vim/pack/gruvbox/start/
git clone --depth 1 https://github.com/morhetz/gruvbox.git ~/.vim/pack/gruvbox/start/gruvbox

cd ~/
wget https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.vimrc
wget https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.tmux.conf

curl -o ~/.vimrc https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.vimrc
curl -o ~/.tmux.conf https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.tmux.conf

curl -o ~/.vim/colors/base16-grayscale-dark.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-grayscale-dark.vim
curl -o ~/.vim/colors/base16-gruvbox-dark-hard.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-gruvbox-dark-hard.vim
