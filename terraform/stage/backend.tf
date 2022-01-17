# terraform {
#   required_providers {
#     yandex = {
#       source  = "yandex-cloud/yandex"
#       version = "0.61.0"}
#   }

terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "reddit-app-bucket"
    region     = "us-east-1"
    key        = "stage/terraform-state.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
