resource "yandex_storage_bucket" "ifebres-backet" {
  access_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.secret_key
  bucket     = "ifebres-backet"
  force_destroy = true 
  anonymous_access_flags {
    read = true
    list = false
  }
}

resource "yandex_storage_object" "picture" {
  access_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.secret_key
  bucket     = "ifebres-backet"
  key        = "picture.png"
  source     = "./picture.png"
  content_type = "image/png"
  acl = "public-read"
  depends_on = [
    yandex_storage_bucket.ifebres-backet
  ]
}
