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
  for_each = var.lambdas

  role_name = coalesce(try(each.value.role_name, null), "${each.value.function_name}-role")
  inline_policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
  environment_variables = merge(
    { SCENARIO_NAME = var.project },
    each.value.environment_variables
  )
}