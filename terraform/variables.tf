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
variable subnet_id {
  description = "Subnet"
  default     = "e2lerbr3up19r3j6nqd1"
}
# variable service_account_key_file{
#   description = "key .json"
# }
