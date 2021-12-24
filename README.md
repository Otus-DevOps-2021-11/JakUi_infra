# JakUi_infra
JakUi Infra repository
YCloud VMs
bastion_IP = 51.250.28.88
someinternalhost_IP = 10.129.0.30
testapp_IP = 51.250.19.226
testapp_port = 9292

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
