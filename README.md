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

*(i) comment effectuer cette tache via ansible ??*

```shell
curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"
```

(3) 

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
python3 -m venv
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
ansible-playbook local-playbook.yml --check
# si ok
ansible-playbook local-playbook.yml
```

