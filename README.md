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

## Проблемы в конфигурации terraform ресурсов путём копирования и вставки кода

- Увеличивается размер файла (больше кода)
- Для каждого инстанса нужно менять имя и некоторые параметры вручную (а если инстансов много?..)
- В случае, если нужно внести правки придётся править resource для каждого инстанса

## Как развернуть приложение на два instance используя terraform

1. Создайте файл `variables.tf`, в нём укажите значения переменных ```cloud_id, folder_id, zone, image_id, public_key_path,``` 
```private_key_path, network_id, subnet_id, external_ipv4, token, instance_count```

2. Выполните комманду terraform apply

3. Для проверки работоспособности приложения в браузере перейдите по адресу loadbalancer'a (значение output-переменной
   `external_load_balancer_address_app`).

## Управление конфигурацией. Основные DevOps инструменты. Знакомство с Ansible

### Команда ansible app -m command -a 'rm -rf ~/reddit' и повторное выполнение плейбука

При выполнени плейбука `Сlone` в первый раз, ansible выполнит модуль `setup` для сбора `gathers facts`, затем - 
скопирует репозиториий `https://github.com/express42/reddit.git` в папку `~/reddit`, команда
`ansible app -m command -a 'rm -rf ~/reddit'` удаляет файлы репозитория. При повторном выполнении плейбука `clone`
ansible не выполняет модуль `setup` (не собирает `gathers facts`), поэтому изменение только одно.
3. Для проверки работоспособности приложения в браузере перейдите по адресу loadbalancer'a (значение output-переменной `external_load_balancer_address_app`).

## Хранение состояний (terraform.tfstate) в облаке

access_key, secret_access_key необходимые для доступа к bucket хранятся отдельно (прописал их в bashrc по шаблону
`export AWS_ACCESS_KEY="access_key"`, `export AWS_SECRET_ACCESS_KEY="secret_access_key"`)

Конфиг-файл для терраформ хранится в облаке в bucket'е `reddit-app-bucket`. Для каждого типа приложения (stage/prod) создан отдельный backend. Для переключения на конфиг-файл конкретного окружения нужно перейти в папку stage для переключения на config stage-окружения или prod для переключения на config prod-окружения и выполнить команду `terraform init`
