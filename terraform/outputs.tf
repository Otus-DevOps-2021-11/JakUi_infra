# output "external_ip_address_app-1" {
#   value = yandex_compute_instance.reddit-app.*.network_interface.0.nat_ip_address[0]
# }

# output "internal_ip_app" {
#   value = yandex_compute_instance.reddit-app.*.network_interface.0.ip_address[0]
# }

# output "external_ip_address_app" {
#   value = yandex_compute_instance.app.network_interface.0.nat_ip_address
# }
# output "external_ip_address_db" {
#   value = yandex_compute_instance.db.network_interface.0.nat_ip_address
# }
# output "external_ip_address_app-2" {
#   value = yandex_compute_instance.reddit-app.*.network_interface.0.nat_ip_address[1]
# }

# output "internal_ip_app-2" {
#   value = yandex_compute_instance.reddit-app.*.network_interface.0.ip_address[1]
# }

# output "target_group_info" {
#   value = yandex_lb_target_group.target_group.id
# }

# output "external_load_balancer_address_app" {
#   value = element(yandex_lb_network_load_balancer.reddit_app_load_balancer.listener.*.external_address_spec[0][*].address, 1)
# }
