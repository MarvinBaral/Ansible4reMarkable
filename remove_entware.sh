#!/bin/bash

#requires ssh setup

#make sure that your reMarkable has WLAN!

ansible-playbook site.remove.yml --tags=remove_entware
ssh root@10.11.99.1 systemctl disable opt.mount
ssh root@10.11.99.1 systemctl stop opt.mount
ssh root@10.11.99.1 rm /home/root/entware_install.sh
ssh root@10.11.99.1 rm /etc/systemd/system/opt.mount
ssh root@10.11.99.1 rm -r /home/root/.entware
ssh root@10.11.99.1 rmdir /opt
