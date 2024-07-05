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
rm -f ~/.config/i3/config ;
curl -o ~/.config/i3/config --create-dirs https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/i3/config ;
curl -o ~/.i3status.conf --create-dirs https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.i3status.conf ;
mkdir -p ~/Downloads && \
    cd ~/Downloads && \
    wget https://dbeaver.io/files/23.2.5/dbeaver-ce-23.2.5-linux.gtk.x86_64.tar.gz && \
    tar -xf dbeaver-ce-23.2.5-linux.gtk.x86_64.tar.gz && \
    rm -f dbeaver-ce-23.2.5-linux.gtk.x86_64.tar.gz && \
    sudo ln -s ~/Downloads/dbeaver/dbeaver /usr/local/bin/dbeaver ;
mkdir -p ~/Downloads && \
    cd ~/Downloads && \
    wget https://dl.pstmn.io/download/latest/linux_64 && \
    tar -xf linux_64 && \
    rm -f linux_64 && \
    sudo ln -s ~/Downloads/Postman/app/postman /usr/local/bin/postman ;
echo -e "You need config the \n1.Lxterminal, \n2.Dbeaver, \n3.Postman, \n4.Cisco, \n5.Ssh-keys, \n6.Docker, \n7.Note files, \n8.Browser links" ;
