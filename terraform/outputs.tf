output "external_ip_address_app" {
  value = [for inst_name in yandex_compute_instance.app : inst_name.network_interface.0.nat_ip_address]
  #value = yandex_compute_instance.app[0].network_interface.0.nat_ip_address
  #value = self.network_interface.0.nat_ip_address
}

output "external_ip_address_lb" {
  value = [for ip in yandex_lb_network_load_balancer.mylb.listener : ip.external_address_spec.0.address]
}
