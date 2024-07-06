# dotfiles

Some config files for programs I actively use.
```
wget "https://raw.githubusercontent.com/ViniciusCruzMoura/dotfiles/master/install.sh" && sh install.sh && rm install.sh
```

```
iwctl
device list
adapter phy0 set-property Powered on
device wlan0 set-property Powered on
station wlan0 scan
station wlan0 get-networks
station wlan0 connect ''

pacman-key --init
pacman -Sy archlinux-keyring
```
