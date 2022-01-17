terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "reddit-app-bucket"
    region     = "us-east-1"
    key        = "prod/terraform-state.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
