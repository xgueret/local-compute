# Local Compute

This repository contains Ansible playbooks for setting up a local compute environment. The playbooks automate the installation and configuration of various tools and packages on your local machine.

## Contents

- `playbook.yml`: Main playbook to execute.
- `roles/`: Directory containing Ansible roles.
  - `common/`: Common tasks for setting up the environment.
  - `git/`: Tasks for installing and configuring Git.
  - `starship/`: Tasks for installing and configuring Starship prompt.

## Prerequisites

- Ansible 2.9 or higher
- Git

## Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/xgueret/local-compute.git
    cd local-compute
    ```

2. Install Ansible if it is not already installed:

    ```sh
    sudo apt update
    sudo apt install ansible
    ```

## Usage

Run the main playbook to set up your local compute environment:

```sh
ansible-playbook playbook.yml


## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.