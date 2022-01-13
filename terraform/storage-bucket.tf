locals {
  folder_id = "b1gsa3n8df9fiuhlhk24"
}

provider "yandex" {
  folder_id = local.folder_id
  zone      = "ru-central1-a"
  token     = "AQAAAABbbNgTAATuwaWzacySDkZ4g99PYL4OuAo"
}

// Create SA
resource "yandex_iam_service_account" "sa" {
  folder_id = local.folder_id
  name      = "reddit-app-sa"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = local.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}

// Use keys to create bucket
resource "yandex_storage_bucket" "test" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "reddit-app-bucket"
}

resource "yandex_storage_object" "object-storage" {
  bucket = "reddit-app-bucket"
  key    = "terraform-state"
  source = "terraform.tfstate"
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
}
