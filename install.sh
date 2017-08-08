 #! /bin/bash

set -eu

##
## Basic
##
sudo apt install emacs-nox git tmux gcc make fish curl

##
## Rust
##
export PATH=$PATH:$HOME/.cargo/bin/
if ! which rustup
then
    curl https://sh.rustup.rs -sSf | sh
fi

rustup update
rustup component add rust-src
cargo install rustfmt
cargo install racer
cargo install ripgrep
cargo install evalrs
cargo install cargo-update
cargo install cargo-kcov
cargo install tokei
