// Create SA
resource "yandex_iam_service_account" "k8s-sa" {
  folder_id = var.folder_id
  name      = "k8s-sa"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "k8s-sa-admin" {
  folder_id = var.folder_id
  role      = "admin"
  member    = "serviceAccount:${yandex_iam_service_account.k8s-sa.id}"
}
