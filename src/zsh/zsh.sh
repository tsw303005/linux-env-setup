#!/bin/bash

main() {
    echo "starting to install zsh..."
    echo $sudoPW | sudo -S apt install -y zsh
    zsh --version

    echo "change default shell from bash to zsh"
    echo $sudoPW | sudo -S chsh -s $(which zsh)
    echo $SHELL
    echo "installing zsh done ~"

    echo "starting to install oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "starting to install autosuggestion on zsh..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
    echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
    bash ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
}

main
