#!/usr/bin/env bash
set -e

curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain nightly-2017-04-19 -y
