#!/usr/bin/env bash
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

##
# Run as root user.
##
run_as_root() {
  local CMD="$*"

  if [[ ${EUID} -ne 0 ]]; then
    CMD="sudo ${CMD}"
  fi

  ${CMD}
}

##
#
##
main() {
  local cuba_cdn=https://raw.githubusercontent.com/javanile/cuba/master
  local cuba_bin=/usr/local/bin/cuba
  local cuba_src=${cuba_cdn}/cuba.sh

  curl -s ${cuba_cdn}/sign.nfo
  [[ -z "${1}" ]] || echo -e "\e[43m\e[97m\e[1m INFO \e[0m Arguments: ${@}"
  echo -e "\e[43m\e[97m\e[1m INFO \e[0m Installing 'cuba' as root..."
  run_as_root curl -sLo "${cuba_bin}" "${cuba_src}?ts=$(date +%s)"
  run_as_root chmod 755 "${cuba_bin}"
  run_as_root chown 0:0 "${cuba_bin}"
  echo -e "\e[42m\e[97m\e[1m DONE \e[0m Type 'cuba' to begin."
}

##
# Entry point
##
main "$@"
