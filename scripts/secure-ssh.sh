#!/bin/bash
username=$1

if [ -z "$username" ]; then
    echo "Usage: ./secure-ssh.sh username"
    exit 1
fi

sudo useradd -m $username
sudo mkdir -p /home/$username/.ssh
sudo cp ~/.ssh/id_rsa.pub /home/$username/.ssh/authorized_keys
sudo chmod 700 /home/$username/.ssh
sudo chmod 600 /home/$username/.ssh/authorized_keys
sudo chown -R $username:$username /home/$username/.ssh
echo "User $username created with passwordless SSH login"
