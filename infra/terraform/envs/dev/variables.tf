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

variable "primary_frontend_bucket_key" {
  type    = string
  default = "frontend"
}

variable "primary_lambda_key" {
  type    = string
  default = "guidance"
}

variable "frontend_buckets" {
  type = map(object({
    bucket_name             = string
    block_public_acls       = optional(bool, false)
    block_public_policy     = optional(bool, false)
    ignore_public_acls      = optional(bool, false)
    restrict_public_buckets = optional(bool, false)
    public_read_enabled     = optional(bool, true)
    index_document          = optional(string, "index.html")
  }))
}

variable "lambdas" {
  type = map(object({
    function_name         = string
    role_name             = optional(string)
    handler               = optional(string, "lambda_function.lambda_handler")
    runtime               = optional(string, "python3.13")
    timeout               = optional(number, 10)
    environment_variables = optional(map(string), {})
    artifact_bucket       = optional(string)
    artifact_key          = optional(string)
    source_code_hash      = optional(string)
  }))
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