#!/usr/bin/env bash
# Copyright (c) 2018-2023 The Rub Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.
# use testnet settings,  if you need mainnet,  use ~/.rubcore/rubd.pid file instead
export LC_ALL=C

rub_pid="$(<~/.rubcore/testnet3/rubd.pid)"
sudo gdb -batch -ex "source debug.gdb" rubd "${rub_pid}"
