
resource "yandex_lb_network_load_balancer" "reddit_app_load_balancer" {
  name        = "reddit-app-load-balancer"

  listener {
    name = "listener-1"
    port = 80
    target_port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = var.network_id

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}