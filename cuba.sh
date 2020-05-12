#!/usr/bin/env bash
set -e

URL=git.io/${1}.sh
STATUS=$(curl -sLI "https://${URL}" | grep "HTTP/1.1" | tail -1 | tr -dc 0-9 | tail -c 3)

echo -en "\e[43m\e[97m\e[1m CURL \e[0m\e[47m\e[97m ${URL} \e[0m"

if [[ "${STATUS}" != "200" ]]; then
  echo -e "\e[41m\e[97m\e[1m ${STATUS} \e[0m"
  exit 1
fi

echo -e "\e[44m\e[97m\e[1m ${STATUS} \e[0m"
curl -sL "https://${URL}" | bash -s "${@:2}"
