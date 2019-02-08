# Vagrant-Ansible
### Introduction:
configure vagrant machine using ansible.
ansible roles in this repo can be used for

 - Creating user
 - Setting up timezone
 - Copying file from local to remote machine
 - Installing packages
 - Setting up latest version of consul

### Requirement:
- Vagrant must be pre install
- Supported host OS: RedHat, CentOS, Ubuntu, Debian, macOS
### Usage:
#### configuration file:
`roles/user_packages/default/main.yml`
```---
user:
  username: testuser ## change your username here
  comment: user for testing ## description about user

date_time:
  timezone: Asia/Kolkata ## change the timezone of system

python_version: 3.7 ## select the python version to install
```
`roles/consul/default/main.yml`
```---
consul_user: consul
consul_group: consul
consul_data_dir : /var/consul/data
consul_agent_dir : /usr/local/etc/consul
consul_bin_path : /usr/bin
consul_download_url: https://releases.hashicorp.com/consul/1.4.2/consul_1.4.2_linux_amd64.zip ## change the url for last version of consul
consul_node_name: "{{ inventory_hostname }}"
consul_datacenter: dc1
consul_version: consul_1.4.2_linux_amd64.zip ## change the consul version
```


RUN:
```bash
$ chmod +x vagrant.sh ansible.sh
$ ./vagrant.sh
```

TESTING:
```bash
$ vagrant ssh
$ id testuser
$ timedatectl status | grep "Time zone"
$ ls /home/testuser
$ python3 --version
$ python3.7 --version
$ systemctl status supervisor
$ sudo systemctl status consul
$ consul kv put hello world
$ consul kv get hello
```
