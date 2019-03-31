#!/bin/bash

echo ">>> Updating repo package list..."
sudo apt-get update; sudo apt-get -y upgrade

echo ">>> Installing common packages/services ..."
sudo apt-get -y install vim openssh-server vsftpd tree unzip curl

echo ">>> Updating shell..."
cat >> ~/.bashrc << EOF
##################### history ##############################
HISTSIZE=1000
HISTFILESIZE=2000

# Enable vi to edit command history
set -o vi

##################### prompt ##############################
#color prompt (long: username & hostname & directory)
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;33m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export PROMPT_DIRTRIM=4

##################### alias ##############################
alias update="sudo apt-get update; sudo apt-get -y upgrade"
alias dmesg="dmesg -T"
alias ll="ls -la"

##################### terminal ##############################
# fix strange character 
export TERM=xterm
export NCURSES_NO_UTF8_ACS=1
export LANG="C.UTF-8"

# undefine CTRL-s/CTRL-q to stop/resume
stty stop undef
stty start undef
stty -ixon -ixoff
EOF
source ~/.bashrc

touch ~/.inputrc
cat >> ~/.inputc << EOF
"\e[A": history-search-backward
"\e[B": history-search-forward
"\e[C": forward-char
"\e[D": backward-char
EOF

touch ~/.vimrc
cat >> ~/.vimrc << EOF
:set background=dark
:set tabstop=4
:set softtabstop=4
:set expandtab
:set shiftwidth=4
:set autoindent
:set ruler
:set showmode
:set nu
EOF

echo ">>> Setup ssh ..."
mkdir -p ~/.ssh; chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys; chmod 600 ~/.ssh/authorized_keys
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_volumio -C "volumio server" -q -P ""
chmod 600 ~/.ssh/id_rsa*
cat ~/.ssh/id_rsa_volumio.pub >> ~/.ssh/authorized_keys

sudo systemctl enable ssh
sudo systemctl restart ssh

echo ">>> Setting FTP server ..."
sudo sed -i 's/^#write_enable=YES$/write_enable=YES/' -i /etc/vsftpd.conf
sudo systemctl enable vsftpd
sudo systemctl restart vsftpd



