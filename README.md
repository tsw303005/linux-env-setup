# linux env setup
## Discription
This is shell script for developer to quickly set up tools needed in Linux. Contact me if you have any suggection.

## Tools
1. git and gitconfig
2. vim
3. docker and docker-compose
4. zsh and oh-my-zsh
5. autosuggestion

## Quick Start
1. create .env file and set variable sudoPW with sudo password.
```
sudoPW=<sudo password>
```
2. install curl
```
sudo apt update && sudo apt upgrade
sudo apt install -y curl
```
2. type the following command on bash shell.
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/tsw303005/linux-env-setup/master/src/setup.sh)"
```

## Requirement
- curl
- bash shell

## Test
I write a dockerfile to test in ubuntu:18.04. You can try in your own docker container.

## Future Work
1. update remove.sh
2. update_tool.sh
3. tmux
4. pyenv
5. kubectl
6. Makefile
7. CMake
