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
rustup component add rustfmt
rustup component add clippy
cargo install ripgrep evalrs cargo-update cargo-kcov cargo-tarpaulin cargo-outdated cargo-readme tokei hb rofis evcxr_repl
cargo +nightly install racer

##
## Python
##
sudo apt install python3 python3-pip
pip3 install pip --upgrade --user
sudo apt remove python3-pip
pip3 install jedi --user
pip3 install virtualenv --user
