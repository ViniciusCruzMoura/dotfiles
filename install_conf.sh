#!/usr/bin/env bash
mkdir -p ~/.vim/pack/ale/start && git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/ale/start/ale

curl -o ~/.vimrc https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.vimrc
curl -o ~/.tmux.conf https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.tmux.conf

curl -o ~/.vim/colors/base16-grayscale-dark.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-grayscale-dark.vim
curl -o ~/.vim/colors/base16-gruvbox-dark-hard.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-gruvbox-dark-hard.vim
