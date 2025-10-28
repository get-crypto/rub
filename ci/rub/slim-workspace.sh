#!/usr/bin/env bash
# Copyright (c) 2025 The Rub Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8

set -eo pipefail

SH_NAME="$(basename "${0}")"

if [ -z "${BUILD_TARGET}" ]; then
  echo "${SH_NAME}: BUILD_TARGET not defined, cannot continue!";
  exit 1;
elif [ -z "${BUNDLE_KEY}" ]; then
  echo "${SH_NAME}: BUNDLE_KEY not defined, cannot continue!";
  exit 1;
fi

TARGETS=(
  # Bundle restored from artifact
  "${BUNDLE_KEY}.tar.zst"
  # Binaries not needed by functional tests
  "build-ci/rubcore-${BUILD_TARGET}/src/rub-tx"
  "build-ci/rubcore-${BUILD_TARGET}/src/bench/bench_rub"
  "build-ci/rubcore-${BUILD_TARGET}/src/qt/rub-qt"
  "build-ci/rubcore-${BUILD_TARGET}/src/qt/test/test_rub-qt"
  "build-ci/rubcore-${BUILD_TARGET}/src/test/test_rub"
  "build-ci/rubcore-${BUILD_TARGET}/src/test/fuzz/fuzz"
  # Misc. files that can be heavy
  "build-ci/rubcore-${BUILD_TARGET}/src/qt/qrc_bitcoin.cpp"
  "build-ci/rubcore-${BUILD_TARGET}/src/qt/qrc_rub_locale.cpp"
)

# Delete what we don't need
for target in "${TARGETS[@]}"
do
  if [[ -d "${target}" ]] || [[ -f "${target}" ]]; then
    rm -rf "${target}";
  fi
done
