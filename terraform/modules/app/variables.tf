variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable subnet_id {
  description = "Subnet for modules"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-base-app"
}

variable appname {
  description = "Name for app resource"
}
