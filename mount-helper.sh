#!/bin/bash
# Set mount point and mount variable
source script-helper.sh


source_me
check_lfs_var


title "DISK LAYOUT"
lsblk
echo
title "SELECT DISK"
read -r disk
echo


title "MOUNT"
echo "Mount point:" $LFS
mkdir -pv $LFS
sudo mount -v -t ext4 $disk $LFS
