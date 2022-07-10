#!/bin/bash

# define result
function checkUserTyping() {
    while true; do
        echo -n "Do you want to install $1? (Y/n): "
        read response
        response=${response:-y}

        if [[ $response == 'y' || $response == 'Y' ]]
        then
            echo "yes"
        elif [[ $response == 'n' || $response == 'N' ]]
        then
            echo "no"
        else
            echo "Please type [yY/nN] to install $1"
        fi
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
    echo $REPO_DIR

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

    # git-config file
    value=$(checkUserTyping "git-config")
    if [ "$value" == "yes" ]
    then
        source $REPO_DIR/src/git/git.sh
    else
        echo "skip setting up gitconfig"
    fi

    # vim
    value=$(checkUserTyping "vim")
    if [ "$value" == "yes" ]
    then
        source $REPO_DIR/src/vim/vim.sh
    else
        echo "skip installing vim"
    fi

    # docker and docker-compose
    
    value=$(checkUserTyping "docker")
    if [ "$value" == "yes" ]
    then
        source $REPO_DIR/src/docker/docker.sh
    else
        echo "skip installing docker"
    fi

    # zsh
    value=$(checkUserTyping "zsh")
    if [ "$value" == "yes" ]
    then
        source $REPO_DIR/src/zsh/zsh.sh
    else
        echo "skip installing zsh"
    fi

    # remove clone file
    rm -rf $REPO_DIR

    # activate zsh shell now
    exec ${which zsh}
}

# entry point
main
