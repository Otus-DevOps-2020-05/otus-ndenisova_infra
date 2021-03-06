variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable subnet_id {
  description = "Subnets for modules"
}
variable db_disk_image {
  description = "Disk image for db"
  default = "reddit-base-db"
}

variable dbname {
  description = "Name for db resource"
}
