#!/bin/bash

set -ex

#This should work for any .deb Package

if [ -d archive ]; then
    cd archive

    apt-ftparchive packages . > Packages

    sudo su -c 'echo "deb [trusted=yes] file:$(pwd)/ ./" >>  /etc/apt/sources.list'

    sudo apt-get update

    cd ../
fi

export DEBIAN_FRONTEND=noninteractive

sudo apt-get install -y icinga2 icinga2-ido-mysql mysql-server

sudo icinga2 feature list

sudo icinga2 daemon -C
