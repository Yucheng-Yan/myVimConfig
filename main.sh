#!/bin/bash

# check if vim is installed
if ! command -v vim &> /dev/null; then
    echo "installing vim..."
    # choose proper package manager
    if [ -x "$(command -v apt)" ]; then
        sudo apt update && sudo apt install -y vim
        sudo apt-get update && sudo apt-get install -y exuberant-ctags
    elif [ -x "$(command -v yum)" ]; then
        sudo yum install -y vim
        sudo yum update && sudo yum install -y ctags
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install -y vim
    elif [ -x "$(command -v pacman)" ]; then
        sudo pacman -Syu --noconfirm vim
	elif [ -x "$(command -v brew)" ]; then
		brew install vim
        brew install ctags
        alias ctags="`brew --prefix`/bin/ctags"
        alias ctags >> ~/.bash_profile
    else
        echo "no common package manager is detected on your system, please install vim manually."
        exit 1
    fi
    echo "vim is installed successfully"
else
    echo "vim is detected on your system"
fi

# install pathogen
if [ ! -d ~/.vim/autoload ]; then
	echo "installing pathogen..."
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	echo "pathogen is installed successfully"
else
	echo "pathogen is detected on your system"
fi

# install vim plugins
echo "installing vim plugins..."
cd ~/.vim/bundle
git clone https://github.com/dense-analysis/ale.git
git clone https://github.com/jlanzarotta/bufexplorer.git
git clone https://github.com/preservim/vim-indent-guides.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/wlangstroth/vim-racket.git
git clone https://github.com/shmup/vim-sql-syntax.git
git clone https://github.com/tpope/vim-fugitive.git

echo "Successfully installed the following plugins:"
ls

# check how many plugins are installed
intended_count=9
plugin_count=$(ls -l | grep -c ^d)
if [ $plugin_count -eq $intended_count ]; then
	echo "All plugins are installed successfully"
else
	missing_count=$((intended_count - plugin_count))
	echo "Failed to install $missing_count plugins"
fi
cd -

# update vimrc
echo "updating vimrc..."
cp vimrc ~/.vimrc

if [ -f ~/.vimrc ]; then
	echo "vimrc is updated successfully"
else
	echo "failed to update vimrc"
	exit 1
fi

echo "All set! Please check the list above to see what's missing."
