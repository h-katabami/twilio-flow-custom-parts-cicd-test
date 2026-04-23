output "frontend_bucket_name" {
  value = aws_s3_bucket.frontend.bucket
}

output "frontend_website_endpoint" {
  value = aws_s3_bucket_website_configuration.frontend.website_endpoint
}

output "lambda_function_name" {
  value = aws_lambda_function.guidance.function_name
}