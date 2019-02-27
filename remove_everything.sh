#!/bin/sh

ansible-playbook site.remove.yml --diff
./remove_entware.sh
./remove_ssh.sh
