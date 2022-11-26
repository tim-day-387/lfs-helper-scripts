#!/bin/bash
# Set up directories on new root filesystem
source "${S_LIB_PATH}"/script-helper.sh


check_lfs_var
check_cmd_for_failure
check_lfs_mount
check_cmd_for_failure


title "CREATE DIRS"
echo "${LFS}"/sources
sudo mkdir -pv "${LFS}"/sources
sudo chmod -v a+wt "${LFS}"/sources


echo "${LFS}"/{bin,etc,lib,sbin,usr,var,tool}
sudo mkdir -pv "${LFS}"/{bin,etc,lib,sbin,usr,var,tool}


case $(uname -m) in
    x86_64)
	echo "${LFS}"/lib64
	sudo mkdir -pv "${LFS}"/lib64 ;;
esac
