#!/bin/bash

#requires ssh setup
#make sure that your reMarkable has WLAN!

read -p "Make sure your reMarkable has a perfect WLAN connection. Then press any key to continue... " -n1 -s
git clone https://github.com/Evidlo/remarkable_entware.git
cd remarkable_entware
scp entware_install.sh root@10.11.99.1:
scp opt.mount root@10.11.99.1:/etc/systemd/system
ssh root@10.11.99.1 ./entware_install.sh
ssh root@10.11.99.1 systemctl enable opt.mount
ssh root@10.11.99.1 /opt/bin/opkg install python
cd ..
rm -rf remarkable_entware
ansible-playbook site.reMarkable.yml --diff --tags=entware
