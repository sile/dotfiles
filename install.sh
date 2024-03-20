#! /bin/bash

set -eu

sudo apt update

##
## Basic
##
sudo apt install emacs-nox git tmux gcc make fish curl cmake pkg-config libssl-dev

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
rustup install nightly
rustup component add rust-src
rustup component add rustfmt
rustup component add clippy
rustup component add rust-analyzer
rustup component add rust-analysis
cargo install ripgrep evalrs cargo-update cargo-outdated du-dust fd-find rofis daberu efmt erlls uribo
