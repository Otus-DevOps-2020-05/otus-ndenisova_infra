# otus-ndenisova_infra
otus-ndenisova Infra repository

==================
[ndenisova@nadin otus-ndenisova_infra]$ ssh -i ~/.ssh/appuser -A -J appuser@84.201.135.63 appuser@10.130.0.13
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

appuser@someinternalhost:~$

==================
[ndenisova@nadin otus-ndenisova_infra]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

84.201.135.63 bastion
10.130.0.13 someinternalhost

[ndenisova@nadin otus-ndenisova_infra]$ cat ~/.ssh/config
Host bastion
  User appuser
  IdentityFile /home/ndenisova/.ssh/appuser

Host someinternalhost
  Hostname someinternalhost
  User appuser
  ProxyCommand ssh -W %h:%p bastion
  IdentityFile /home/ndenisova/.ssh/appuser
[ndenisova@nadin otus-ndenisova_infra]$ chmod 600 ~/.ssh/config
[ndenisova@nadin otus-ndenisova_infra]$ ssh someinternalhost
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

appuser@someinternalhost:~$

================

bastion_IP = 84.201.135.63
someinternalhost_IP = 10.130.0.13

================

testapp_IP = 130.193.49.24
testapp_port = 9292

yc compute instance create   --name reddit-app1   --hostname reddit-app1   --memory=4   --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB   --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4   --metadata serial-port-enable=1 --metadata-from-file user-data=metadata.yml


#DZ terraform-1
Сделано создание количества инстансов (var.count_int) исходно развернутых из готового packer'ом образа и запущенных на них сервисах puma на 9292 порту и балансировщик для нихна том же 9292.

Outputs:

external_ip_address_app = [
  "84.201.135.226",
  "84.201.130.14",
]
external_ip_address_lb = [
  "84.201.128.58",
]

===========================
DZ ansible-1

При запуске clone.yml, клонируется репозиторий reddit
в app:/home/ubuntu/reddit

Задание со звездой.
Сделана возможность работы с динамическим inventory в json формате
ansible -i dynamic_inventory.py all -m ping

Разница в статическои и динамическом, что hosts это dict или list соотв.
и в динамическом требуется обязательное наличие all
и vars для хостов получилось видно только в _meta

==========================
DZ ansible-2
Реализована возможность развертывания mongo и ruby на соотв. packer
image'ах reddit-base-db-ansible и reddit-base-app-ansible через ansible.
