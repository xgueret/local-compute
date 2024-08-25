#!/bin/bash

# set -x

# Determine the directory where the script is located
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Path to the virtual environment
VENV_PATH="$SCRIPT_DIR/venv"

# List of valid tags
VALID_TAGS=("update")

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

# Function to display help
show_help() {
    echo "Usage: $0 [options] [tag]"
    echo
    echo "Description:"
    echo "  This script sets up a Python virtual environment, installs Ansible if it's not already installed,"
    echo "  and runs an Ansible playbook with optional tags."
    echo
    echo "Options:"
    echo "  --help         Show this help message and exit"
    echo
    echo "Arguments:"
    echo "  tag            The tag to filter the playbook execution (valid tags are: ${VALID_TAGS[*]})"
    echo
    echo "Examples:"
    echo "  $0 update      Run the playbook with the 'update' tag"
    echo "  $0             Run the playbook without any tags"
    echo
    echo "Note:"
    echo "  Take time to fully understand what this script does before running it ;-)"

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
fi

# Handle help option
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Check if tags are passed as an argument
if [ -n "$1" ]; then 
    TAG=$1
    if is_valid_tag "$TAG"; then                
        echo "Running playbook with tags: $TAG"
        ansible-playbook $SCRIPT_DIR/playbook.yml --tags "$TAG"
    else
        echo "Error: Invalid tag '$TAG', Valid tags are: ${VALID_TAG[*]}"
        exit 1
    fi
else
    echo "Running playbook without tags"
    ansible-playbook $SCRIPT_DIR/playbook.yml
fi

# Deactivate the virtual environment
deactivate
