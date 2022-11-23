#!/bin/bash
# Common helper functions for scripts


title() (
    ./print-title.py "$1"
)


check_lfs_var() {
    title "CHECK MOUNT POINT"

    if [ -z "${LFS}" ]; then
	echo "LFS is not set."
	read -r LFS
	export LFS
	return -1
    else
	echo "LFS is set to" $LFS
	return 0
    fi

    echo
}


source_me() {
    if [ -z "$PS1" ] ; then
	echo "This script must be sourced. Use \"source <script>\" instead."
	exit
    fi
}
