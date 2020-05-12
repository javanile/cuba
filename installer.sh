#!/usr/bin/env bash
set -e

##
# cuba
# ====
# by Francesco Bianco
# bianco@javanile.org
# MIT License
##

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

  curl -s ${cuba_cdn}/cuba.txt
  echo -e "\e[43m\e[97m\e[1m INFO \e[0m Installing 'neo' as root..."
  run_as_root curl -sLo "${neo_bin}" "${neo_src}?ts=$(date +%s)"
  run_as_root chmod 755 "${neo_bin}"
  run_as_root chown 0:0 "${neo_bin}"
  echo -e "\e[42m\e[97m\e[1m DONE \e[0m Type 'neo --help' to begin."
}

##
#
##
main "$@"
