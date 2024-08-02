#!/bin/bash

parted --script /dev/sda \
    mklabel msdos \
    mkpart primary 0G 8G \
    mkpart primary 8G 23G \
	mkpart primary 23G 100% \
	set 1 boot on
sleep 5
mkfs.ntfs -f /dev/sda1
mkfs.ntfs -f /dev/sda2
mkfs.ext4 /dev/sda3
sleep 10
fdisk /dev/sda <<EOF
t
1
7

t
2
7

w
EOF
