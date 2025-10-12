#!/bin/sh
  #==========================================
  # Project: essentials4alpine.sh
  # Author:  ConzZah / ©️ 2025
  # Last Modification: 24.03.2025 / 16:15
  #==========================================

essentials="pciutils grep sed lsblk mount nano htop ntfs-3g 7zip fastfetch ffmpeg wget curl git openssh sudo man-pages mandoc bash bash-completion python3 mpv w3m w3m-image xz shadow gvfs udisks2 e2fsprogs e2fsprogs-extra android-tools libqrencode-tools docs"

echo -e "\n ~~~ essentials4alpine by ConzZah ~~~\n
This will install the following packages:\n"
echo "$essentials"| tr ' ' '\n'| sed 's#^#- #g'
echo -e "\n[ PRESS ANY KEY TO START ]\n"; read -n1 -s
doas apk -U upgrade # <-- runs apk update & upgrade before installing anything
#########################################
# basic ufw setup
! type -p ufw && { doas apk add ip6tables ufw 
doas ufw enable     # <-- enables firewall
doas rc-update add ufw # <-- adds init scripts
doas ufw default deny incoming # <-- deny all incoming traffic
doas ufw default allow outgoing # <-- allow all outgoing traffic
doas ufw limit SSH  # <-- open SSH port but protect against brute-force login attacks
doas ufw reload ;} # <-- reload ufw when done & continue
#########################################
doas apk add $essentials
