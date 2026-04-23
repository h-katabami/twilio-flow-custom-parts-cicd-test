variable "bucket_name" {
  type = string
}

variable "block_public_acls" {
  type    = bool
  default = false
}

variable "block_public_policy" {
  type    = bool
  default = false
}

variable "ignore_public_acls" {
  type    = bool
  default = false
}

variable "restrict_public_buckets" {
  type    = bool
  default = false
}

variable "public_read_enabled" {
  type    = bool
  default = true
}

variable "index_document" {
  type    = string
  default = "index.html"
}
