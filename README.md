# Arch Linux Installation and Dotfiles

## Installation

```bash
# Boot Arch live CD into root user

# Setup internet
wifi-menu
ping archlinux.org

# Update system clock
timedatectl set-ntp true

# Partition and format disks
cfdisk /dev/sda

# VirtualBox (BIOS/GPT)
# Partition schema:
# - /dev/sda1 (1M) BIOS boot partition
# - /dev/sda2 (Rest) Linux filesystem

# Physical (UEFI/GPT)
# Partition schema:
# - /dev/sda1 (500M) EFI system partition
# - /dev/sda2 (Rest) Linux filesystem

# Format filesystem
mkfs.ext4 /dev/sda2

# Mount file system
mount /dev/sda2 /mnt

# Install base system
pacstrap /mnt base base-devel

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Change root
arch-chroot /mnt

# Install git
pacman -S git

# Clone this repo
git clone https://github.com/WaveHack/dotfiles-arch.git /tmp/dotfiles

# Run first chroot script
/tmp/dotfiles/bin/01-arch-chroot.sh

# Exit arch-chroot
exit

# Reboot
reboot

# Login with normal user

# Run second script
/tmp/dotfiles/bin/02-normal-user.sh
```
