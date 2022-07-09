#!/bin/bash

main() {
    echo "starting to install vim..."
    echo $sudoPW | sudo -S apt install vim
    echo "installing vim done~"
}

main
