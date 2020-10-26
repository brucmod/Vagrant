#!/bin/bash
# This is only to be used as a prep for a non Pure Test Drive Environment
# Brian Kuebler 4/17/20
# Bruce Modell 7/22/20
# Chris Crow 7/22/20

# Install necessary packages, only python2 installed

echo "#####################################"

#remove password requirement for sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers

#makesure all packages are updated
sudo apt-get update
sudo apt install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt install ansible --assume-yes



echo "#### Installing the Purestorage Ansible Collection  ####"

ansible-galaxy collection install purestorage.flasharray


#install Iscsi-tools
sudo apt install open-iscsi --assume-yes

#Install Multipath tools
sudo apt install multipath-tools --assume-yes

#install scsi tools
sudo apt install -y scsitools --assume-yes



# Typing "ansible-playbook" everytime is a hassle...
echo "" >> ~/.bashrc
echo "alias ap='ansible-playbook'" >> ~/.bashrc
echo "alias P='cd ~/newstack_demo/ansible_playbooks'" >> ~/.bashrc
#Install Helm
sudo snap install helm --classic

