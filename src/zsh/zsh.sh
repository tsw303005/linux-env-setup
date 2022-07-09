#!/bin/bash

main() {
    echo "starting to install zsh..."
    echo $sudoPW | sudo -S apt install zsh
    zsh --version

    echo "change default shell from bash to zsh"
    echo $sudoPW | sudo -S chsh -s $(which zsh)
    echo $SHELL
    echo "installing zsh done ~"

    echo "starting to install oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

main
