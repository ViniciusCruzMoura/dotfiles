#!/usr/bin/env bash

mkdir -p ~/.vim/pack/gruvbox/start/
git clone --depth 1 https://github.com/morhetz/gruvbox.git ~/.vim/pack/gruvbox/start/gruvbox

curl -o ~/.vimrc https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.vimrc
curl -o ~/.tmux.conf https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.tmux.conf

curl -o ~/.vim/colors/base16-grayscale-dark.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-grayscale-dark.vim
curl -o ~/.vim/colors/base16-gruvbox-dark-hard.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-gruvbox-dark-hard.vim
curl -o ~/.vim/colors/gruvbox.vim --create-dirs https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
curl -o ~/.vim/colors/256_noir.vim --create-dirs https://raw.githubusercontent.com/andreasvc/vim-256noir/master/colors/256_noir.vim
