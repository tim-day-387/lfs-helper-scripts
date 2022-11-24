#!/bin/bash
# Common helper functions for scripts


title() (
    ./print-title.py "$1"
)


check_lfs_var() {
    title "CHECK MOUNT POINT"

    if [ -z "${LFS}" ]; then
	echo "LFS is not set."

	if [ "$(check_if_sourced)" == "source" ]; then
	    read -r LFS
	    export LFS
	else
	    return 255
	fi
    else
	echo "LFS is set to" "${LFS}"
    fi

    echo
    return 0
}


check_lfs_mount() {
    mountpoint "${LFS}"
    is_mounted=$?

    if [ "${is_mounted}" -ne 0 ]; then
	echo "The directory must be mounted first."
	return 255
    fi

    return 0
}


check_if_sourced() {
    if [ -z "${PS1}" ]; then
	echo "subshell"
    else
	echo "source"
    fi
}


source_me() {
    if [ "$(check_if_sourced)" == "subshell" ]; then
	echo "This script must be sourced. Use \"source <script>\" instead."
	exit
    fi
}


get_disk() {
    title "DISK LAYOUT"
    lsblk
    echo
    title "SELECT DISK"
    read -r disk
    echo
}


if [ "$(check_if_sourced)" == "source" ]; then
    alias check_cmd_for_failure='
has_failed=$?
if [ "${has_failed}" -ne 0 ]; then
        return 255
fi
'
else
    shopt -s expand_aliases
    alias check_cmd_for_failure='
has_failed=$?
if [ "${has_failed}" -ne 0 ]; then
        exit
fi
'
fi
