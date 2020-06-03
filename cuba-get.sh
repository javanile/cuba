#!/bin/bash

##
# CUBA
# ====
#
# CURL/BASH running utility.
#
# Copyright (c) 2020 Francesco Bianco <bianco@javanile.org>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
##

set -e

bash=bash
bpkg_lib=https://raw.githubusercontent.com/bpkg/bpkg/master/lib
bpkg_json=${bpkg_lib}/json/JSON.sh
bpkg_install=${bpkg_lib}/install/install.sh

[[ $EUID -ne 0 ]] && bash="sudo bash"

( curl -s ${bpkg_install}; echo "bpkg_json=\$(curl -s ${bpkg_json})";
  echo 'bpkg-json () { bash -c "${bpkg_json}" -- "$@"; }'; echo 'bpkg_install --global "$@"'; ) | ${bash} -s -- "$@"
