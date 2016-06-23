#! /bin/bash

set -eu

DOT_FILES=(.emacs .gitconfig .gitignore .tmux.conf)

for f in ${DOT_FILES[@]}
do
    ln -fns $PWD/$f $HOME/$f
done

MY_BASHRC_PATH=$PWD/.bashrc
if ! grep $MY_BASHRC_PATH $HOME/.bashrc
then
    echo "" >> $HOME/.bashrc
    echo "# My .bashrc" >> $HOME/.bashrc
    echo ". $MY_BASHRC_PATH" >> $HOME/.bashrc
fi
