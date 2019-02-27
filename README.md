Ansible4reMarkable - A easy way to install new features on your reMarkable tablet

Ansible requires ssh and python.
Therefore there is one script to setup easy ssh access. You will have to enter your ssh password found in the "About" section in your reMarkable settings.
The second script installs the entware package manager (https://github.com/Evidlo/remarkable_entware) and then installs python with it.
The Ansible tasks will rely on other packages from the entware package manager too.

Setup Requirements:
- Install ansible from package manager
- (For extra fun install cowsay from package manager)
- You need a rsa publickey in ~/.ssh/id_rsa.pub (run ssh-keygen if you don't have them)
- Activate WLAN on your reMarkable and make sure it has a good connection!

Setup:

./setup_everything
You will be asked for your ssh password

Usage:

ansible-playbook site.reMarkable.yml                            #just run it, install everything without looking
ansible-playbook site.reMarkable.yml --diff                     #show things that have been changed
ansible-playbook site.reMarkable.yml --diff --check             #dry-run to find things that will be changed
ansible-playbook site.reMarkable.yml --diff --limit reMarkables #limit execution to certain hosts
ansible-playbook site.reMarkable.yml --diff --tags basic        #specify certain tasks to be executed

Currently implemented tasks (selectable by --tags):

- "basic" - installs some basic packages one might want when being in the reMarkable commandline (currently: python, nano, git, htop, lsblk, lscpu).
  You can edit them in roles/basic/tasks/main.yml

TODO: here will be added a collection of tasks to install the best features from https://github.com/reHackable/awesome-reMarkable and other reMarkable repos

Uninteresting Helper Tasks:

- "entware" - a task to complete the entware installation
- "ssh_local" - adds 10.11.99.1 as "remarkable" in your ssh config - now you can just type "ssh remarkable" to reach it