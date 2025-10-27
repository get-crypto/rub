#!/usr/bin/env bash
# Copyright (c) 2021-2023 The Rub Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C
set -e

# Get Tor service IP if running
if [[ "$1" == "rubd" ]]; then
  # Because rubd only accept torcontrol= host as an ip only, we resolve it here and add to config
  if [[ "$TOR_CONTROL_HOST" ]] && [[ "$TOR_CONTROL_PORT" ]] && [[ "$TOR_PROXY_PORT" ]]; then
    TOR_IP=$(getent hosts "$TOR_CONTROL_HOST" | cut -d ' ' -f 1)
    echo "proxy=$TOR_IP:$TOR_PROXY_PORT" >> "$HOME/.rubcore/rub.conf"
    echo "Added \"proxy=$TOR_IP:$TOR_PROXY_PORT\" to $HOME/.rubcore/rub.conf"
    echo "torcontrol=$TOR_IP:$TOR_CONTROL_PORT" >> "$HOME/.rubcore/rub.conf"
    echo "Added \"torcontrol=$TOR_IP:$TOR_CONTROL_PORT\" to $HOME/.rubcore/rub.conf"
    echo -e "\n"
  else
    echo "Tor control credentials not provided"
  fi
fi

exec "$@"
