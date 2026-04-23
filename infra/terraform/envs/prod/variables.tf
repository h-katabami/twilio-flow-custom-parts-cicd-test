variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type     = string
  default  = null
  nullable = true
}

variable "account_id" {
  type = string
}

variable "frontend_bucket_name" {
  type = string
}

variable "lambda_function_name" {
  type = string
}

variable "lambda_artifact_bucket" {
  type    = string
  default = ""
}

variable "lambda_artifact_key" {
  type    = string
  default = ""
}

variable "lambda_source_code_hash" {
  type    = string
  default = ""
}