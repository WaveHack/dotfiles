#!/bin/bash

# Check for root
if [[ $EUID -ne 0 ]]; then
    echo "Script must be run as root" >&2
    exit 1
fi

# Double-check
echo "This script will provision Arch Linux on your system."
echo "Repo: https://github.com/WaveHack/dotfiles-arch"
echo
echo "It is assumed you ran the steps in README.md prior to this, and are in an"
echo "arch-chroot environment during Arch Linux setup."
echo
read -p "Continue? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted"
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

# Timezone
echo "Setting timezone to Europe/Amsterdam"
ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

# Localization
echo "Setting locale to en_US.UTF-8"
sed -i "s/#en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Network configuration
if [[ ! -f /etc/hostname ]]; then
    echo -n "Enter hostname: "
    read hostname
    echo
    echo $hostname > /etc/hostname
    echo -e "\n" >> /etc/hosts
    echo -e "127.0.0.1\tlocalhost.localdomain\tlocalhost\n" >> /etc/hosts
    echo -e "::1\t\tlocalhost.localdomain\tlocalhost\n" >> /etc/hosts
    echo -e "\n127.0.0.1\t$hostname.localdomain\t$hostname\n" >> /etc/hosts
fi

# Root passwd
echo "Enter password for root user"
passwd

# Boot loader
echo "Installing GRUB boot loader"
yes | pacman -S grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Packages
echo "Installing system packages"
yes | pacman -S htop \
                pkgfile \
                rxvt-unicode \
                unzip \
                wget \
                zsh

# ranger rofi polybar

pkgfile -u

# Change root shell
# echo "Changing root shell to ZSH"
# chsh -s /usr/bin/zsh

# Sudo (wheel group)
echo "Enabling sudo permissions for wheel group"
sed 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers

# Default user
echo "Creating default user with sudo permissions through wheel group"
echo -n "Enter username: "
read username
echo

useradd $username --create-home -s /usr/bin/zsh -g users -G wheel
echo "Created user $username"
passwd $username

# Enable DHCP client daemon service
echo "Enabling DHCP client daemon service"
systemctl enable dhcpcd

# /etc/pacman.conf: enable color and verbose pkg list

echo "Done. Please exit arch-chroot and reboot your system."
