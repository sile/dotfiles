#! /bin/bash

set -eu

##
## Basic
##
sudo apt install emacs-nox git tmux gcc make fish

##
## Rust
##
export PATH=$PATH:$HOME/.cargo/bin/
if ! which rustup
then
    curl https://sh.rustup.rs -sSf | sh
fi

rustup update
cargo install rustfmt
cargo install racer
cargo install ripgrep
cargo install evalrs
cargo install cargo-update
