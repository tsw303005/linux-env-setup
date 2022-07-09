#!/bin/bash

# define result
function checkUserTyping() {
    while true; do
        read -p "Are you want to install $1? (y/n) " response
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
    export BACKUP_DIR=$HOME/.linux-env-setup

    # type password to authorize
    # make sure that you have already created .env file and set up variable
    typePW

    echo "start to set up env"
    echo $sudoPW | sudo -S apt update && sudo -S apt upgrade

    echo "installing curl now"
    echo $sudoPW | sudo -S apt install curl

    # git
    echo "installing git now"
    echo $sudoPW | sudo -S apt install git
    git clone https://github.com/tsw303005/linux-env-setup.git
    cd ./linux-env-setup

    checkUserTyping "git-setup"
    value=$?
    if [ "$value" == 1 ]
    then
        source ./git/git.sh
    else
        echo "skip setting up gitconfig"
    fi


    # zsh
    checkUserTyping "zsh"
    value=$?
    if [ "$value" == 1 ]
    then
        source ./zsh/zsh.sh
    else
        echo "skip installing zsh"
    fi

    # vim
    checkUserTyping "vim"
    value=$?
    if [ "$value" == 1 ]
    then
        source ./vim/vim.sh
    else
        echo "skip installing vim"
    fi

    # docker and docker-compose
    checkUserTyping "docker"
    value=$?
    if [ "$value" == 1 ]
    then
        source ./docker/docker.sh
    else
        echo "skip installing docker"
    fi

    echo "all tasks done~"
}

# entry point
main
