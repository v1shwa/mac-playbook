## Ansible Playbook for Mac       [![Build Status](https://travis-ci.org/v1shwa/mac-playbook.svg?branch=master)](https://travis-ci.org/v1shwa/mac-playbook)

Ansible playbook to download, install & configure almost all the software I use on my mac. The dotfiles for vim,tmux,zsh & other tools are available [here](https://github.com/v1shwa/mydotfiles).

### Installation
 - Clone the repo by runnning
        
        git clone https://github.com/v1shwa/mac-playbook.git
        
 - Add/Modify all your brew formulae in `roles/mac/vars/brew_config.yml` file and the cask packages in `roles/mac/vars/cask_config.yml`.
 - Run the following command from the repo location. Enter the account password when prompted.

        bash start.sh
- This bash script will ensure you have commandline tools, pip & ansible installed and then runs actual playbook to install all the required applications. 


#### Inspiration
_Jeff Geerling's [repo](https://github.com/geerlingguy/mac-dev-playbook)_

#### License
[MIT](https://github.com/v1shwa/mac-playbook/blob/master/LICENSE)
