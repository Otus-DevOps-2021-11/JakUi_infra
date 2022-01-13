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
    key        = "reddit-app-bucket-2/terraform-state.tfstate"
    access_key = "xV2xYWmnk0"
    secret_key = "VfaBvI60L1F9uoEgjIOgaBaEi9-WC"


    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
