#!/bin/bash
##
# Simple script to test n ansible playbook in a Vagrant box
##

__SCRIPT_NAME="test_playbook.sh"
__BOX_NAME="playground"

if [ $# -ne "1" ]; then
  echo "Wrong amount of arguments!"
  echo
  echo "Usage: $__SCRIPT_NAME playbook_name"
  echo
  echo "Available playbooks: "
  for play in $(ls -1 playbooks/*.yml); do
    echo "  - $(echo $play | sed -e 's/.yml//' -e 's/playbooks\///')"
  done
  exit
fi

if [ ! -e "./playbooks/$1.yml" ]; then
  echo "Playbook $1.yml doesn't exist!"
  exit
fi

cp ./playbooks/$1.yml ./test_playbook.yml

ansible-playbook --syntax-check --list-tasks -i local.ini test_playbook.yml

if [ $? -ne 0 ]; then
  echo "Error: syntax check error on playbook: $1.yml"
  exit 1
fi

echo
echo "Running playbook: $1"
echo

if [ "$(vagrant status | grep "${__BOX_NAME}.*running" | wc -l)" -eq "1" ];
then
  echo "Re-provisioning..."
  vagrant provision
else
  echo "Booting up the virtual machine..."
  vagrant up --provision
fi
