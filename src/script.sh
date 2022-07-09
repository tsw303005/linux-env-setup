#!/bin/bash

read -s -p "Enter Password for sudo: " sudoPW

echo "start to set up env \n"
echo $sudoPW | sudo -S apt update && sudo -S apt upgrade

echo "installing curl now \n"
sudo -S apt install curl
