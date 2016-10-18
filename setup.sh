#! /bin/bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.git_template ~/.git_template

git config --global init.templatedir '~/.git_template'

## font
cd /tmp
git clone https://github.com/yascentur/RictyDiminished.git
mkdir ~/.fonts
cd RictyDiminished/
cp *.ttf ~/.fonts

## NeoBundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
