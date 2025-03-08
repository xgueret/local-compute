# Automated Laptop Setup and Configuration with Ansible

![](img/local_laptop.png)

## Description ![Stars](https://img.shields.io/github/stars/xgueret/local-compute?style=social) ![Last Commit](https://img.shields.io/github/last-commit/xgueret/local-compute) ![Status](https://img.shields.io/badge/Status-Active-brightgreen)

This project uses Ansible to automate the installation and configuration of a laptop running Debian or Ubuntu. It includes essential software installation, system configuration, and the management of development and containerization tools.

## Project Structure

- `ansible.cfg`: Global Ansible configuration
- `inventory.yml`: Defines hosts and groups for Ansible
- `playbook.yml`: Main playbook orchestrating the role execution
- `roles/`: Contains various Ansible roles
  - `local_laptop/`: Laptop installation and configuration
  - `docker/`: Docker and Docker Compose installation
  - `git/`: Git configuration
  - `kubectl/`: `kubectl` installation
  - `devtools/`: Development tools installation (e.g., Postman)
  - `asdf/`: `asdf` version manager setup
  - `hashicorp_software/`: Terraform and Vagrant installation
  - `startship/`: Starship installation

```
.
├── ansible.cfg
├── check_ansible_vault.sh
├── group_vars
│   └── all
├── img
│   └── local_laptop.png
├── local_laptop.sh
├── playbook.yml
├── pyvenv.cfg
├── README.md
├── remove_asdf_setup.yml
├── remove_packages.yml
├── requirement.txt
├── revert_kubernetes_setup.yml
├── roles
│   ├── asdf
│   ├── devtools
│   ├── docker
│   ├── git
│   ├── hashicorp_software
│   ├── homebrew
│   ├── kubectl
│   ├── local_laptop
│   └── startship
├── terraform
│   ├── main.tf
│   ├── terraform.tfstate
│   └── variables.tf
└── venv

```



## 📚 Prerequisites

- Debian-based system (Debian 12, Ubuntu...)
- Python 3.8 or higher
- Ansible installed on the local machine



## 🚀 Installation

### 1. Clone the Repository

```sh
git clone <REPO_URL>
cd <REPO_NAME>
```

### 2. Install Dependencies

```sh
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirement.txt
```

### 3. Configure Ansible Vault

If files are encrypted with `ansible-vault`, ensure you have the password file:

```sh
export ANSIBLE_VAULT_PASSWORD_FILE=~/Workspace/.vault/.vault_password
```

### 4. Run the Playbook

```sh
ansible-playbook playbook.yml
```

Or with a specific tag:

```sh
ansible-playbook playbook.yml --tags install
```



## 🏷️Available Tags

- `install`: Base installation
- `update`: Package updates
- `configure`: System configuration
- `remove_packages`: Uninstall specific software
- `asdf`: Manage plugins with `asdf`
- `kubernetes`: Setup `kubectl`
- `docker`: Install and configure Docker



## 🕵️‍♀️Security

The project uses `pre-commit` to ensure files containing secrets are properly encrypted with `ansible-vault`.

```
pre-commit install
```



## 👥 Contributors

- **Author**: Xavier GUERET [![GitHub followers](https://img.shields.io/github/followers/xgueret?style=social)](https://github.com/tonykipkemboi) [![Twitter Follow](https://img.shields.io/twitter/follow/xgueret?style=social)](https://x.com/hixmaster) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=flat&logo=linkedin)](https://www.linkedin.com/in/xavier-gueret-47bb3019b/)



## 👥 Contributing

Contributions are welcome! Please feel free to submit a [Pull Request](https://github.com/xgueret/local-compute/pulls).



## 📄 License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/xgueret/local-compute/blob/main/LICENSE) file for details.
