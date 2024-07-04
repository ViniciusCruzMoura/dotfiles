#!/usr/bin/env bash
curl -o ~/.vimrc https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.vimrc ;
curl -o ~/.tmux.conf https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.tmux.conf ;
curl -o ~/.vim/colors/base16-grayscale-dark.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-grayscale-dark.vim ;
curl -o ~/.vim/colors/base16-gruvbox-dark-hard.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-gruvbox-dark-hard.vim ;
sudo pacman -Syu ;
sudo pacman -S --needed lxterminal \
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
	transmission-qt \
	libreoffice-fresh \
	libreoffice-fresh-pt-br \
	rofi \
	unrar \
	openconnect \
	xarchiver ;
curl -o ~/.screenlayout/setup.sh --create-dirs https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.screenlayout/setup.sh ;
curl -o ~/.config/i3/config --create-dirs https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/i3/config ;
curl -o ~/.i3status.conf --create-dirs https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.i3status.conf ;
echo -e "You need config the \n1.Lxterminal, \n2.Dbeaver, \n3.Postman, \n4.Cisco, \n5.Ssh-keys, \n6.Docker, \n7.Note files, \n8.Browser links" ;
