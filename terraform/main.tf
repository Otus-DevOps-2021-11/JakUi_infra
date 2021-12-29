# provider "yandex" {
#   token     = "AQAAAABbbNgTAATuwaWzacySDkZ4g99PYL4OuAo"
#   #  service_account_key_file = "path_to_service_account_key_file"  !!! Вставить путь к файлу, убрать токен
#   cloud_id  = "b1gjitf868lee0aep2g3"
#   folder_id = "b1gsa3n8df9fiuhlhk24"
#   zone      = "ru-central1-b"
# }

provider "yandex" {
  # service_account_key_file = var.service_account_key_file
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  resources {
    cores  = 2
    memory = 2
  }

  # boot_disk {
  #   initialize_params {
  #     image_id = "fd87rrd7ekbn2j6r4d14"
  #   }
  # }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.image_id
    }
  }

  # network_interface {
  #   # Указан id подсети default-ru-central1-a
  #   subnet_id = "e2lerbr3up19r3j6nqd1"
  #   nat       = true
  # }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }

  #   metadata = {
  #   ssh-keys = "ubuntu:${file("~/.ssh/ubuntu.pub")}"
  # }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    # private_key = file("~/.ssh/ubuntu")
    # private_key = var.private_key_path
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

}