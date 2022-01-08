resource "yandex_lb_target_group" "target_group" {
  name      = "reddit-app-target-group"
  region_id = "ru-central1"
  folder_id = var.folder_id

  target {
    subnet_id = var.subnet_id
    address   = yandex_compute_instance.app.network_interface.0.ip_address
  }

  target {
    subnet_id = var.subnet_id
    address   = yandex_compute_instance.app_2.network_interface.0.ip_address
  }
}