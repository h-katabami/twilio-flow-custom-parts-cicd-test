output "frontend_bucket_name" {
  value = try(module.frontend_bucket[var.primary_frontend_bucket_key].bucket_name, null)
}

output "frontend_website_endpoint" {
  value = try(module.frontend_bucket[var.primary_frontend_bucket_key].website_endpoint, null)
}

output "lambda_function_name" {
  value = try(module.lambda[var.primary_lambda_key].function_name, null)
}

output "frontend_bucket_names" {
  value = { for key, bucket in module.frontend_bucket : key => bucket.bucket_name }
}

output "lambda_function_names" {
  value = { for key, lambda in module.lambda : key => lambda.function_name }
}