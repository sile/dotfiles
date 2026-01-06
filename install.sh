#! /bin/bash

set -eu

sudo apt update

##
## Basic
##
sudo apt install git tmux gcc make fish curl cmake pkg-config libssl-dev

## For Termux
# pkg install binutils

##
## Rust
##
export PATH=$PATH:$HOME/.cargo/bin/
if ! which rustup
then
    curl https://sh.rustup.rs -sSf | sh
fi

rustup update
rustup component add rustfmt
rustup component add clippy
cargo install evalrs fd-find daberu mamediff mamegrep grepatch niho kk jcfmt
