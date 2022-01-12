variable cloud_id {
  description = "Cloud"
}
variable token {
  description = "Token"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-b"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable network_id {
  description = "Network"
  default     = "enp92bdakjlqdr33mghf"
}
variable subnet_id {
  description = "Subnet"
  default     = "e2lerbr3up19r3j6nqd1"
}
variable external_ipv4 {
  description = "External IPV4 adress"
  default     = "51.250.28.254"
}
variable instance_count {
  description = "Number of instances to create"
  default     = 1
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}