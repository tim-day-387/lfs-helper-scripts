#!/bin/bash
# Disable swapping for given file
source script-helper.sh


get_disk


sudo /sbin/swapoff -v "${disk}"
