#!/bin/bash

set -e

main() {
    echo "starting to install vim..."
    echo $sudoPW | sudo -S apt install -y vim
    echo "finish installing vim done~"
}

main
