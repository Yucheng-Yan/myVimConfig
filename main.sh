#!/bin/bash

# check if vim is installed
if ! command -v vim &> /dev/null; then
    echo "installing vim..."
    # choose proper package manager
    if [ -x "$(command -v apt)" ]; then
        sudo apt update && sudo apt install -y vim
    elif [ -x "$(command -v yum)" ]; then
        sudo yum install -y vim
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install -y vim
    elif [ -x "$(command -v pacman)" ]; then
        sudo pacman -Syu --noconfirm vim
    else
        echo "no common package manager is detected on your system, please install vim manually."
        exit 1
    fi
    echo "vim is installed successfully"
else
    echo "vim is detected on your system"
fi

