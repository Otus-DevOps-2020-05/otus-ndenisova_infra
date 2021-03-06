variable cloud_id {
  description = "Cloud"
}
variable appname {
  description = "Name for app"
}
variable dbname {
  description = "Name of db"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key .json"
}

variable private_key_path {
  description = "Path to private key for connection"
}

variable count_int {
  description = "Num of instances for balancer"
  default     = 1
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-base-app"
}

variable db_disk_image {
  description = "Disk image for db"
  default     = "reddit-base-db"
}
