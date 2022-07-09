#!/bin/bash

main() {
    echo "starting to install git..."
    echo $sudoPW | sudo -S apt install git-all

    if [ -f $HOME/.gitconfig ]; then
        mv $HOME/.gitconfig $BACKUP_DIR
    fi
    cp $REPO_DIR/src/git/.gitconfig $HOME/.gitconfig

    echo "installing git and config .gitconfig file done~"
}

main
