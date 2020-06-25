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
