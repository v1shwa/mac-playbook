#!/bin/bash

# Check if a package is installed
function is_installed {
  local result_=1
  type $1 >/dev/null 2>&1 || { local result_=0; }
  echo "$result_"
}

echo "Configuring your dev environment..Look out for the fast-moving train.."

# Install X-code, if not
if ! xcode-select --install 2>&1 | grep installed; then

    # Wait for xcode to install
    echo -n "Waiting for Xcode cli tools to install."
    while true
    do
        if xcode-select --install 2>&1 | grep installed; then
            echo "Xcode cli tools Installed successfully!"
            break
        fi
        echo -n "."
        sleep 0.5s
    done
fi

# Install pip
if [[ $(is_installed pip) -eq 0 ]]; then
    sudo easy_install pip
fi

# Install ansible
if [[ $(is_installed ansible) -eq 0 ]]; then
    sudo pip install ansible
fi

# Run playbook
ansible-playbook ./playbook.yml -i ./hosts --ask-become-pass

# Done
sl
echo "Done. Here's some cheesy words for you."
fortune | cowsay -f cheese

