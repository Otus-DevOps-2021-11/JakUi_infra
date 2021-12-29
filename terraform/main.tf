provider "yandex" {
  token     = "AQAAAABbbNgTAATuwaWzacySDkZ4g99PYL4OuAo"
  #  service_account_key_file = "path_to_service_account_key_file"  !!! Вставить путь к файлу, убрать токен
  cloud_id  = "b1gjitf868lee0aep2g3"
  folder_id = "b1gsa3n8df9fiuhlhk24"
  zone      = "ru-central1-b"
}

resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87rrd7ekbn2j6r4d14"
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = "e2lerbr3up19r3j6nqd1"
    nat       = true
  }
}