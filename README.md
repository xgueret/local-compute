# Local Compute

This repository contains Ansible playbooks for setting up a local compute environment. The playbooks automate the installation and configuration of various tools and packages on your local machine.



## Contents

- `playbook.yml`: Main playbook to execute.
- `roles/`: Directory containing Ansible roles.
  - `git/`: Tasks for installing and configuring Git.
  - `starship/`: Tasks for installing and configuring Starship prompt.
  - `hashicorp_software/`: Tasks for installing and configuring hashicorp software (vagrant, terraform).
  - `podman/`: Tasks for installing and configuring Podman.
  - `docker/`: Tasks for installing and configuring Docker.
- `local_laptop.sh` The local_laptop.sh script plays a crucial role in setting up the local-compute package (soon), which is intended for Debian-based distributions. 
    It automates the installation and configuration process using Ansible. Key functionalities include:
    Creates a Python virtual environment: Ensures dependencies are isolated and managed locally.
    Installs Ansible if necessary: Checks if Ansible is installed and installs it if not present.
    Executes Ansible playbook: Runs the playbook.yml file, which defines the tasks to configure the machine.



## Prerequisites

- Ansible 2.9 or higher
- Git
- ubuntu or debian



## Installation

1. Clone the repository:

    ```shell
    git clone https://github.com/xgueret/local-compute.git
    cd local-compute
    ```



## Usage

Before run you need to add the following file

```shell
./roles/git/vars/main/my-git-congig-global.yml
```
or modify 
```shell
./roles/git/defaults/main.yml
```



### Set up your local compute environment:

**:warning: <u>Take time to fully understand what this script does before running it</u>**

```sh
chmod +x local_laptop.sh
./local_laptop.sh --help
```



## Note

:thinking: **Podman** and **Docker** can coexist on the same machine without any issues. 

1. **Complete Isolation**: Podman and Docker operate independently. Podman is designed to be daemonless, whereas Docker relies on a central daemon to manage containers. This fundamental difference allows Podman and Docker to coexist without directly interfering with each other.
2. **Separate File Locations**: The configuration files and data directories for Podman and Docker are distinct. Podman stores its configurations and images in different locations than Docker, avoiding file conflicts.
3. **Similar Commands**: While Podman commands are very similar to Docker’s (often interchangeable), the two tools do not share the same container sessions or networks, reducing the risk of conflicts.
4. **Resource Management**: As with any resource-intensive applications, you'll need to be mindful of resource usage (CPU, memory, storage) if you’re running many containers with both tools simultaneously.



## :facepunch: Contribution

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. **Fork the repository** to your own GitHub account.
2. **Clone your fork** locally:

```shell
git clone https://github.com/yourusername/local-compute.git
cd manage-repo
```

**Create a new branch** for your feature or bug fix:

```shell
git checkout -b my-new-feature
```

**Make your changes** and commit them with a clear message:

```shell
git commit -m "Add new feature"
```

**Push your branch** to your fork:

1. ```shell
   git push origin my-new-feature
   ```

2. **Open a Pull Request** on the original repository and describe your changes.

By following these steps, you can help improve the project for everyone!
