#!/bin/bash

# Check if a package is installed
function is_installed {
  local result_=1
  type $1 >/dev/null 2>&1 || { local result_=0; }
  echo "$result_"
}

echo "Configuring your dev environment.. Sit tight!"

# Install X-code, if not
xcode_dir=$(/usr/bin/xcode-select -print-path 2>/dev/null)

if ! [ -d "$xcode_dir" ]; then
    echo "Command Line Tools is missing. Attempting to install.."
    xcode-select --install > /dev/null 2>&1
    # Wait for xcode to install
    echo -n "Waiting for Commandline tools to install."
    while true
    do
        if xcode-select --install 2>&1 | grep installed; then
            echo "Command Line Tools is installed successfully"
            break
        fi
        echo -n "."
        sleep 1s
    done
fi

# Install pip
if [[ $(is_installed pip) -eq 0 ]]; then
    echo "Installing PIP"
    sudo easy_install pip
fi

# Install ansible
if [[ $(is_installed ansible) -eq 0 ]]; then
    echo "Installing Ansible"
    sudo pip install ansible
fi

# Run playbook
ansible-playbook ./playbook.yml -i ./hosts  --ask-become-pass

# Done
echo "Done."
fortune | cowsay -f cheese

