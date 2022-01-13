terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "reddit-app-bucket"
    region     = "us-east-1"
    key        = "stage/terraform-state.tfstate"
    access_key       = "GEW1m4aOa4Rx"
    secret_key       = "i0UQyDQdggmOpoxLPB_kI9"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
