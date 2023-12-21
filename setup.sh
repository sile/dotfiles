#! /bin/bash

set -eu

DOT_FILES=(.emacs .gitconfig .gitignore .tmux.conf)

for f in ${DOT_FILES[@]}
do
    cp $PWD/$f $HOME/$f
done

mkdir -p ~/.config/fish/
cp config.fish ~/.config/fish/config.fish
