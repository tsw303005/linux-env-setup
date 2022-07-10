#!/bin/bash

set -e

main() {
    echo "starting to install zsh..."
    echo $sudoPW | sudo -S apt install -y zsh
    zsh --version

    echo "set up zsh env"
    ZSH_NAME=zsh
    echo "export SHELL=$HOME/${which zsh}"
    echo $SHELL
    echo "installing zsh done ~"

    echo "starting to install oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "starting to install autosuggestion on zsh..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
    echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
    
    # activate zsh shell now
    echo '[ -z "$ZSH_VERSION" ] && exec $SHELL -l' >> $HOME/.bash_profile
}

main
