terraform {
  required_providers {
    yandex = {}
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "reddit-app-bucket"
    region     = "us-east-1"
    key        = "prod/terraform-state.tfstate"
    access_key       = "GEW1m4aOadWoG90P74Rx"
    secret_key       = "i0UQyDQdgqM4QllXSHVxQGNNQBpgmOpoxLPB_kI9"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
