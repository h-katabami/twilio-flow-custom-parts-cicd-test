terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "lambda_role" {
  source   = "../../modules/iam-role"
  for_each = var.deploy_lambda ? var.lambdas : {}

  role_name = coalesce(try(each.value.role_name, null), "${each.value.function_name}-role")
  inline_policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:${var.aws_region}:${var.account_id}:*"
      }
    ]
  })
}

module "frontend_bucket" {
  source   = "../../modules/s3-bucket"
  for_each = var.deploy_frontend ? var.frontend_buckets : {}

  bucket_name             = each.value.bucket_name
  block_public_acls       = each.value.block_public_acls
  block_public_policy     = each.value.block_public_policy
  ignore_public_acls      = each.value.ignore_public_acls
  restrict_public_buckets = each.value.restrict_public_buckets
  public_read_enabled     = each.value.public_read_enabled
  index_document          = each.value.index_document
}

module "lambda" {
  source   = "../../modules/lambda-function"
  for_each = var.deploy_lambda ? var.lambdas : {}

  function_name    = each.value.function_name
  role_arn         = module.lambda_role[each.key].role_arn
  handler          = each.value.handler
  runtime          = each.value.runtime
  timeout          = each.value.timeout
  s3_bucket        = var.lambda_artifact_bucket
  s3_key           = var.lambda_artifact_key
  source_code_hash = var.lambda_source_code_hash
  environment_variables = merge(
    { SCENARIO_NAME = var.project },
    each.value.environment_variables
  )
}