#!/bin/bash

set -e

main() {
    echo "starting to install docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    echo sudoPW | sudo -S sh get-docker.sh

    echo "starting to install docker-compose..."
    echo sudopW | sudo -S apt-get install -y docker-compose-plugin
    echo "installing docker and docker-compose done~"

    # remove get-docker.sh
    echo sudoPW | sudo -S rm get-docker.sh
}

main
