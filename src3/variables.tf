variable "yandex_cloud_id" {
  default = "b1grtmm0e3bfv2rf4kiq"
}
variable "yandex_folder_id" {
  default = "b1gd5rvg0g57hu28ajgt"
}
variable "iso_id" {
  default = "fd827b91d99psvq5fjit"
}
variable "yandex_zone" {
  default = "ru-central1-a"
}
variable "user" {
  default = "ifebres"
}
variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
variable "private_key_path" {
  default = "~/.ssh/id_rsa"
}

### Storage vars

variable "bucket_name" {
  type        = string
  default     = "ifebres-bucket"
  description = "Name of bucket to use"
}

variable "web_bucket_name" {
  type        = string
  default     = "www.hovard777.ru"
  description = "Name of web bucket to use"
}

variable "object_name" {
  type        = string
  default     = "index.html"
  description = "Name of index page"
}

variable "object_source" {
  type        = string
  default     = "index.html"
  description = "File name for index page"
}
