# Ansible playbook для установки тестового patroni


#    5432 PostgreSQL standard port.
#    6432 PgBouncer standard port.
#    8008 patroni rest api port required by HAProxy to check the nodes status
#    2379 etcd client port required by any client including patroni to communicate with etcd
#    2380 etcd peer urls port required by the etcd members communication
#    5000 HAProxy frontend listening port, establishing connection to backend database servers via pgbouncer port 6432
#    5001 HAProxy frontend listening port, establishing connection to backend replica database servers via pgbouncer port 6432
#    7000 HAProxy stats dashboard

Не оттестировано на дистрибутивах Debian.

## Установка ansible

Так получилось, что у меня в WSL2 стоит Ubuntu:

```shell
apt install python3.10-venv
python3 -m venv venv
. ~/venv/bin/activate
python3 -m pip install ansible
```
add /etc/hosts on all node
192.168.1.183 patroni1
192.168.1.243 patroni2
192.168.1.244 patroni3

Генерируем ssh ключ:

```shell
ssh-keygen
```

Копируем ключики в виртуальные машины из [hosts.yaml](hosts.yml):

 ```shell
ssh-copy-id root@patroni1
ssh-copy-id root@patroni2
ssh-copy-id root@patroni3

```

## Жестко привязка по Айпи аддресам Поменять при использовании
## Сервисные функции

Сервисные функции находятся в директории `services`

```shell
######## cloud init install 3 node #########
	cd cloud && install3node.sh

########## install patroni via pip3 ################
   ansible-playbook ./services/ping.yaml
   ansible-playbook ./services/prepare-hosts.yaml 
   ansible-playbook ./services/install-etcd.yaml 
   ansible-playbook ./services/install-patroni.yaml 
   ansible-playbook ./services/install-pgbouncer.yaml
   ansible-playbook ./services/install-ha.yaml
   ansible-playbook ./services/debug.yaml -vvvvv

```


* `ha_cluster_virtual_ip` - виртуальный IP адрес.
* `ha_cluster_virtual_port` - порт. Не должен быть равен 6443.



