#!/bin/bash

main() {
    echo "starting to install docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    echo sudoPW | sudo -S sh get-docker.sh
    echo "installing docker and docker-compose done~"
}

main
