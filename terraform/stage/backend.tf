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
    access_key       = "GEW1m4x"
    secret_key       = "i0UQyDQdgqM4QBpgmOpoxLPB_kI9"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
