#!/bin/bash
# Enable swapping for given file
source script-helper.sh


get_disk


sudo /sbin/swapon -v "${disk}"
