#! /bin/bash

set -eu

##
## Basic
##
sudo apt install emacs-nox git tmux

##
## Erlang
##
ERL_PACKAGE=esl-erlang_19.0-1~ubuntu~xenial_amd64.deb
sudo apt install libwxbase3.0-0v5 libwxgtk3.0-0v5

if ! which erl
then
    if ! [ -f $HOME/Downloads/$ERL_PACKAGE ]
    then
        curl https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/$ERL_PACKAGE -o $HOME/Downloads/$ERL_PACKAGE
    fi
    sudo dpkg -i $HOME/Downloads/$ERL_PACKAGE
fi

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
