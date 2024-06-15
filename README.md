A la première connexion 



**(1)  se connecter en root** 

```shell
su root
```

ajouter mon user au groupe sudoers

```shell
sudo visudo
# ajouter la ligne suivante
# monuser ALL=(ALL) NOPASSWD:ALL
```



**(2) installer le package python3-venv**

```shell
sudo apt install python3-venv git
```

```shell
mkdir Workspace
cd Workspace
```

faire un git clone

```shell
git clone git@github.com:xgueret/local-compute.git
```

> ajouter ma clef publique dans github
>
> ```shell
>  # gen
>  ssh-keygen -t rsa -b 4096
> ```

```shell
python3 -m venv /path/venv
```

```shell
source venv/bin/activate
```



**(4) Installation de ansible**

```shell
pip install ansible ansible-lint
```

(5) executer le playbook

```shell
mkdir deb_packages
```

```shell
ansible-playbook local-playbook.yml --check
# si ok
ansible-playbook playbook.yml
```

simple mise à jour via le play book

```shell
ansible-playbook local-playbook.yml --tags update
```

liste des tags possible

- update
- software
- install
- deb
- vagrant
- startship
- common