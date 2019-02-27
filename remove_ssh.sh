#!/bin/bash

ssh root@10.11.99.1 rm -r /home/root/.ssh

ansible-playbook site.remove.yml --diff --limit=Localhosts
