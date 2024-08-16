#!/usr/bin/env bash

get_distribution() {
	lsb_dist=""
	if [ -r /etc/os-release ]; then
		lsb_dist="$(. /etc/os-release && echo "$ID")"
	fi
	echo "$lsb_dist"
}

do_install() {
    lsb_dist=$( get_distribution )
    lsb_dist="$(echo "$lsb_dist" | tr '[:upper:]' '[:lower:]')"

    case "$lsb_dist" in

        arch)
            sudo pacman -Syu ;
            sudo pacman -S --needed lxterminal \
                xorg-xrandr \
                pavucontrol \
                pipewire \
                pipewire-pulse \
                blueman \
                bluez \
                bluez-utils \
                networkmanager \
                tlp \
                tlp-rdw \
                smartmontools \
                ethtool \
                firefox \
                vim \
                git \
                tmux \
                mpv \
                neofetch \
                ttf-hack \
                ttc-iosevka \
                scrot \
                xorg-xcalc \
                transmission-qt \
                libreoffice-fresh \
                libreoffice-fresh-pt-br \
                rofi \
                unzip \
                openconnect \
                udisks2 ;
            ;;

        debian)
            sudo apt update ;
            sudo apt install vim \
                tmux \
                neofetch \
                git ;
            ;;

        *)
	    echo
	    echo "ERROR: Unsupported distribution '$lsb_dist'"
	    echo
            echo "please install arch or debian..."
            exit 0
            ;;

    esac
}

do_config_vim_tmux() {
    curl -o ~/.vimrc https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.vimrc ;
    curl -o ~/.tmux.conf https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.tmux.conf ;
    curl -o ~/.vim/colors/base16-grayscale-dark.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-grayscale-dark.vim ;
    curl -o ~/.vim/colors/base16-gruvbox-dark-hard.vim --create-dirs https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-gruvbox-dark-hard.vim ;
}

do_config_i3() {
    curl -o ~/.screenlayout/setup.sh --create-dirs https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.screenlayout/setup.sh ;
    rm -f ~/.config/i3/config ;
    curl -o ~/.config/i3/config --create-dirs https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/i3/config ;
    curl -o ~/.i3status.conf --create-dirs https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/.i3status.conf ;
}

do_download_dbeaver_and_postman() {
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
}

do_install
do_config_vim_tmux
do_config_i3
do_download_dbeaver_and_postman

echo
echo "You need config:"
echo "  lxterminal"
echo "  dbeaver"
echo "  postman"
echo "  ssh-key"
echo "  docker"
echo "  notefiles"
echo "  browser links"
echo
