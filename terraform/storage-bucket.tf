locals {
  folder_id = "b1gsa3n8df9fiuhlhk24"
}

provider "yandex" {
  folder_id = local.folder_id
  zone      = "ru-central1-a"
  token     = "AQAAAg99PYL4OuAo"
}

// Create SA
resource "yandex_iam_service_account" "sa2" {
  folder_id = local.folder_id
  name      = "reddit-app-sa2"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "sa2-editor" {
  folder_id = local.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa2.id}"
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa2.id
  description        = "static access key for object storage"
}

// Use keys to create bucket
resource "yandex_storage_bucket" "test" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "reddit-app-bucket"
}
