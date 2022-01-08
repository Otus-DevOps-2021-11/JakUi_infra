output "external_ip_address_app" {
  value = yandex_compute_instance.app.network_interface.0.nat_ip_address
}
output "external_load_balancer_address_app" {
  value = yandex_lb_network_load_balancer.reddit_app_load_balancer.listener.*.external_address_spec[*][*]["address"]
}
