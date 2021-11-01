#! /bin/bash

set -eu

sudo apt update

##
## Basic
##
sudo apt install emacs-nox git tmux gcc make fish curl cmake pkg-config libssl-dev

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
rustup component add rls
rustup component add rust-analysis
rustup +nightly component add miri
cargo install ripgrep evalrs cargo-update cargo-kcov cargo-outdated tokei rofis evcxr_repl du-dust

# TODO: install gh and erlang_ls
