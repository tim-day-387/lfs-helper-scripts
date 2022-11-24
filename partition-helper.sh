#!/bin/bash
# Wrapper to fdisk
source script-helper.sh


title "DISK LAYOUT"
lsblk
echo
title "SELECT DISK"
read -r disk
echo


title "PARTITION MAKER"
sudo fdisk "${disk}"
