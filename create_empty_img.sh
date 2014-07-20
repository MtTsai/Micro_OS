#!/bin/bash

DISK=disk.img

# create a empty disk image with 1.44Mb
dd if=/dev/zero of=$DISK bs=512 count=2880

