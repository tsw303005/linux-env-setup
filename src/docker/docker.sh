#!/bin/bash

main() {
    echo "starting to install docker..."
    echo $sudoPW | sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    echo "installing docker and docker-compose done~"
}

main
