terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "reddit-app-bucket-2"
    region     = "us-east-1"
    key        = "prod-1/terraform-state.tfstate"
    access_key       = "GEW1m4aOa4Rx"
    secret_key       = "i0UQyDQdggmOpoxLPB_kI9"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
