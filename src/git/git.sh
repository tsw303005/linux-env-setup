#!/bin/bash

set -e

main() {
    echo "starting to setup .gitconfig"

    echo "instlling gitconfig file in $REPO_DIR"
    export REPO_DIR=$HOME/linux-env-setup
    export BACKUP_DIR=$HOME/.linux-env-backup

    if [ -f $HOME/.gitconfig ]; then
        mv $HOME/.gitconfig $BACKUP_DIR/.gitconfig
    fi
    
    echo $sudoPW | sudo -S cp $REPO_DIR/src/git/.gitconfig /.gitconfig

    echo "installing git and config .gitconfig file done~"
}

main
