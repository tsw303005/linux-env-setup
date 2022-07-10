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
sudo apt update
sudo apt install -y curl
```
2. type the following command on bash shell.
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/tsw303005/linux-env-setup/master/src/setup.sh)"
```

## Requirement
- curl
- bash shell

## Future Work
1. update remove.sh
2. tmux
3. pyenv
4. kubectl
5. Makefile
6. CMake
