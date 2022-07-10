#!/bin/bash

set -e

main() {
    if [ -f $HOME/.gitconfig ]; then
        mv $HOME/.gitconfig $BACKUP_DIR
    fi
    cp $REPO_DIR/src/git/.gitconfig $HOME/.gitconfig

    echo "installing git and config .gitconfig file done~"
}

main
