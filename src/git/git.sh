#!/bin/bash

set -e

main() {
    echo "starting to setup .gitconfig"
    if [ -f $HOME/.gitconfig ]; then
        echo $sudoPW | sudo -S mv $HOME/.gitconfig $BACKUP_DIR/
    fi
    cp $REPO_DIR/src/git/.gitconfig $HOME/.gitconfig

    echo "installing git and config .gitconfig file done~"
}

main
