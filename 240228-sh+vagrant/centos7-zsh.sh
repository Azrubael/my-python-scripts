#!/bin/bash

hostname centos7
yum install git vim -y
sudo yum install mc -y
echo "export EDITOR=vim" >> /home/vagrant/.bashrc

###########################
#   zsh - configuration   #
###########################
sudo yum install zsh -y
su - vagrant -c 'sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
echo "
export EDITOR=vim
# ZSH_THEME=agnoster" >> /home/vagrant/.zshrc
chsh -s /bin/zsh vagrant