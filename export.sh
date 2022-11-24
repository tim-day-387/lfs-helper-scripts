#!/bin/bash
# Script to point towards all other scripts


export S_PATH="$(dirname "$(realpath ${BASH_SOURCE})")"
export S_LIB_PATH="$(dirname "$(realpath ${BASH_SOURCE})")/src/lib"
source "${S_LIB_PATH}/script-helper.sh"
source_me


if [ "$1" == "-v" ]; then
    title "LOCATIONS"
    echo "Script location:" $S_PATH
    echo "Library location:" $S_LIB_PATH
    echo
fi
