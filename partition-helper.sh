#!/bin/bash
# Wrapper to fdisk
source script-helper.sh


get_disk


title "PARTITION MAKER"
sudo fdisk "${disk}"
