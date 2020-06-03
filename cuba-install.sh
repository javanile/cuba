#!/bin/bash

bash=bash
bkpg_install=https://raw.githubusercontent.com/bpkg/bpkg/master/lib/install/install.sh

if [[ $EUID -ne 0 ]]; then
    bash="sudo bash"
fi

(curl -s ${bkpg_install}; echo "bpkg_install --global $1") | ${bash}
