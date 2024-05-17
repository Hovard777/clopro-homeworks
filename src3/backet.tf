resource "yandex_storage_bucket" "web_bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.secret_key
  bucket     = var.web_bucket_name
  force_destroy = true
  acl        = "public-read"
  anonymous_access_flags {
    read        = true
    list        = true
    config_read = true
  }

  website {
    index_document = "index.html"
  }
}

resource "yandex_storage_bucket" "bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.secret_key
  bucket     =  var.bucket_name 
  force_destroy = true
  acl        = "public-read"
  anonymous_access_flags {
    read        = true
    list        = true
    config_read = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}


resource "yandex_storage_object" "index" {
  access_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.secret_key
  bucket     = var.web_bucket_name
  key        = var.object_name
  source     = var.object_source
}

resource "yandex_storage_object" "object" {
  access_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-backet-static-key.secret_key
  bucket     = var.bucket_name
  key        = var.object_name
  source     = var.object_source
}
