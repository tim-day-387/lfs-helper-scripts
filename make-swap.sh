#!/bin/bash
# Create swap partition on given file
source script-helper.sh


get_disk


sudo mkswap "${disk}"
