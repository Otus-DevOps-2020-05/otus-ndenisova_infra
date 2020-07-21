При запуске clone.yml, клонируется репозиторий reddit
в app:/home/ubuntu/reddit

Задание со *.
Сделана возможность работы с динамическим inventory в json формате
ansible -i inventory.json all -m ping

Разница в статическои и динамическом, что hosts это dict или list соотв.
и в динамическом требуется обязательное наличие all
и vars для хостов получилось видно только в _meta
