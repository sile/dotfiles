#! /bin/bash

set -eu

DOT_FILES=(.emacs .gitconfig .gitignore .tmux.conf)

for f in ${DOT_FILES[@]}
do
    ln -fns $PWD/$f $HOME/$f
done

mkdir -p ~/.config/fish/
ln -fns config.fish ~/.config/fish/config.fish
