output "external_ip_address_app_1" {
  value = yandex_compute_instance.app.network_interface.0.nat_ip_address
}

output "internal_ip_app_1" {
  value = yandex_compute_instance.app.network_interface.0.ip_address
}

output "external_ip_address_app_2" {
  value = yandex_compute_instance.app_2.network_interface.0.nat_ip_address
}

output "internal_ip_app_2" {
  value = yandex_compute_instance.app_2.network_interface.0.ip_address
}

output "target_group_info" {
  value = yandex_lb_target_group.target_group
}

# output "external_load_balancer_address_app" {
#   value = element(yandex_lb_network_load_balancer.reddit_app_load_balancer.listener.*.external_address_spec[0][*].address, 1)
# }
