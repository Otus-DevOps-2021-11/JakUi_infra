# JakUi_infra
JakUi Infra repository
YCloud VMs
bastion_IP = 51.250.28.88
someinternalhost_IP = 10.129.0.30

## Сборка образов VM приСборка образов VM при помощи Packer

- Создал service account key file
- Создал файл-шаблон Packer
- Создал скрипты для provisioners
- Установил приложение (для запуска перейдите по адресу http://51.250.31.159:9292/)
- Параметризовал шаблон и другие опции билдера

## Чтобы создать instance с деплоем приложения запустите команду ниже
```yc compute instance create    \
--name reddit \
--hostname reddit \
--memory=4 \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
--network-interface subnet-name=default-ru-central1-b,nat-ip-version=ipv4 \
--metadata-from-file user-data=cloud-init.yml \
--metadata 'serial-port-enable=1'
```
