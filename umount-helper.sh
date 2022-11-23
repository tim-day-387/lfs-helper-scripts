#!/bin/bash
# Set mount point and mount variable
. script-helper.sh


source_me
check_lfs_var


sudo umount $LFS
unset LFS
