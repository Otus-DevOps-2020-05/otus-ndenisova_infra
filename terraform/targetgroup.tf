
resource "yandex_lb_target_group" "t-group" {
  name      = "my-target-group"
  region_id = "ru-central1"

  dynamic "target" {
    for_each = [for inst_name in yandex_compute_instance.app :
      {
        ipaddr = inst_name.network_interface.0.ip_address
      }
    ]

    content {
      subnet_id = "e9bshq1k8dc0fpl8oqle"
      address   = target.value.ipaddr
    }
  }
}
