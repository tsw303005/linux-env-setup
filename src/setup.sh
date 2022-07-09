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
    if [ -f .env ]
    then
        export $(cat ./.env | xargs)
    else
        echo "please create .env file in src dir"
        exit 1
    fi

    if [ -z "$sudoPW" ]
    then
        echo "please set up sudoPW variable in .env file"
        exit 1
    fi
}


main() {
    # type password to authorize
    # make sure that you have already created .env file and set up sudoPW variable
    typePW

    echo "start to set up env \n"
    echo $sudoPW | sudo -S apt update && sudo -S apt upgrade

    echo "installing curl now \n"
    sudo -S apt install curl

    # checkUserTyping
    checkUserTyping "zsh"
    if [ $? ]
    then
        source ./zsh/zsh.sh
    else
        echo "skip install zsh"
    fi
}

# entry point
main
