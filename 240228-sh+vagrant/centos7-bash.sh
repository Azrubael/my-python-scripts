#!/bin/bash

hostname centos7
yum install vim tree zip unzip -y
sudo yum install mc -y
if [[ -z "$(grep '^export EDITOR=vim' /home/vagrant/.bashrc)" ]]; then
    echo "export EDITOR=vim" >> /home/vagrant/.bashrc
    echo "vim set as the default text editor."
else
    echo "Note: vim is already the default text editor."
fi