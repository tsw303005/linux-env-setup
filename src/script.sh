#!/bin/bash

echo "start to set up env \n"
sudo apt update && sudo apt upgrade

echo "installing curl now \n"
sudo apt install curl

echo "installing vim now \n"
sudo apt install vim

echo "installing git now \n"
sudo apt install git

echo "installing docker"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
