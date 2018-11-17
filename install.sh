#! /bin/bash

set -eu

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
rustup component add rustfmt-preview
rustup component add clippy-preview
cargo install ripgrep evalrs cargo-update cargo-kcov cargo-outdated cargo-readme tokei hb rofis evcxr_repl
cargo +nightly install racer
