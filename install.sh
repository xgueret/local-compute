#!/bin/bash

# Path to the virtual environment
VENV_PATH="/opt/local-compute/venv"

# List of valid tags
VALID_TAGS=("update" "install" "configure")

# Function to check if a tag is valid
is_valid_tag() {
    local tag=$1
    for valid_tag in "${VALID_TAGS[@]}"; do
        if [[ "$valid_tag" == "$tag" ]]; then
            return 0
        fi
    done
    return 1
}

# Create the virtual environment if it doesn't exist
if [ ! -d "$VENV_PATH" ]; then
    echo "Creation Python virtual environment..."
    python3 -m venv "$VENV_PATH"
fi

# Activate the virtual environment
source "$VENV_PATH/bin/activate"


#Check if Ansible is installed, install if not
if ! command -v ansible-playbook &> /dev/null; then
    echo "Ansible not found, installing..."
    pip install ansible
else
    echo "Ansible is already installed"
fi

# Check if tags are passed as an argument
if [ -n "$1" ]; then 
    TAG=$1
    if is_valid_tag "$TAG"; then                
        echo "Running playbook with tags: $TAG"
        ansible-playbook /opt/local-compute/playbook.yml --tags "$TAG"
    else
        echo "Error: Invalid tag '$TAG', Valid tags are: ${VALID_TAG[*]}"
        exit 1
    fi
else
    echo "Running playbook without tags"
    ansible-playbook /opt/local-compute/playbook.yml
fi

# Deactivate the virtual environment
deactivate

