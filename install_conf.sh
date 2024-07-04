#!/usr/bin/env bash
curl -o ~/.vimrc https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.vimrc
curl -o ~/.tmux.conf https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.tmux.conf
curl -o ~/.vim/colors/base16-grayscale-dark.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-grayscale-dark.vim
curl -o ~/.vim/colors/base16-gruvbox-dark-hard.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-gruvbox-dark-hard.vim
yes | sudo pacman -S --needed lxterminal \
	arandr \
	gpicview \
	pavucontrol \
	pulseaudio \
	nitrogen \
	blueman \
	bluez \
	bluez-utils \
	networkmanager \
	tlp \
	tlp-rdw \
	smartmontools \
	ethtool \
	xfce4-power-manager \
	chromium \
	notepadqq \
	git \
	tmux \
	vlc \
	pcmanfm \
	neofetch \
	ttf-hack \
	ttc-iosevka \
	xfce4-screenshooter \
	gnome-calculator \
	transmission \
	libreoffice-fresh \
	libreoffice-fresh-pt-br \
	rofi \
	unrar \
	openconnect \
	xarchiver
