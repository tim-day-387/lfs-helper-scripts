#!/bin/bash
# Set up directories on new root filesystem
source "${S_LIB_PATH}"/script-helper.sh


check_lfs_var
check_cmd_for_failure
check_lfs_mount
check_cmd_for_failure


title "CREATE DIRS"
echo "${LFS}"/sources
sudo mkdir -v "${LFS}"/sources
sudo chmod -v a+wt "${LFS}"/sources
