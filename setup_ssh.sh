#!/bin/bash

#this adds 10.11.99.1 as "remarkable" in .ssh/config
ansible-playbook site.reMarkable.yml --diff --limit=Localhosts
#copies your rsa publickey
ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.11.99.1
