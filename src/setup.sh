#!/bin/bash

# define result
function checkUserTyping() {
    echo "1"
    while true; do
        read -p "Are you want to install $1? (y/n) " response
        echo "2"
        case $response in
            [yY]) return 1
                ;;
            [nN]) return 0
                ;;
            *) echo "please typing yY/nN to confirm for installing $1"
                ;;
        esac
    done
}

# check password
function typePW() {
    if [ -f $HOME/.env ]
    then
        export $(cat $HOME/.env | xargs)
    else
        echo "please create .env file in $HOME/.env"
        exit 1
    fi

    if [ -z "$sudoPW" ]
    then
        echo "please set up variable in .env file"
        exit 1
    fi
}


main() {
    # setup path
    export REPO_DIR=$HOME/linux-env-setup
    export BACKUP_DIR=$HOME/.linux-env-backup
    echo $REPO_DIR
    echo $BACKUP_DIR

    if [[ ! -d "$BACKUP_DIR" ]]
    then
        echo "create backup dir"
        mkdir -p $BACKUP_DIR
    fi

    # type password to authorize
    # make sure that you have already created .env file and set up variable
    typePW

    echo "start to set up env"
    echo $sudoPW | sudo -S apt update && sudo -S apt upgrade

    # git
    echo "installing git now"
    echo $sudoPW | sudo -S apt-get install -y git
    git clone https://github.com/tsw303005/linux-env-setup.git $REPO_DIR

    checkUserTyping "git-setup"
    value=$?
    if [ "$value" == 1 ]
    then
        echo "start to setup gitconfig"
        source $REPO_DIR/src/git/git.sh
    else
        echo "skip setting up gitconfig"
    fi

    # vim
    checkUserTyping "vim"
    value=$?
    if [ "$value" == 1 ]
    then
        source $REPO_DIR/src/vim/vim.sh
    else
        echo "skip installing vim"
    fi

    # docker and docker-compose
    checkUserTyping "docker"
    value=$?
    if [ "$value" == 1 ]
    then
        source $REPO_DIR/src/docker/docker.sh
    else
        echo "skip installing docker"
    fi

    # zsh
    checkUserTyping "zsh"
    value=$?
    if [ "$value" == 1 ]
    then
        source $REPO_DIR/src/zsh/zsh.sh
    else
        echo "skip installing zsh"
    fi
}

# entry point
main
