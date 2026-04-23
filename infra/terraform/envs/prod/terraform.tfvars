project                     = "cicd-test"
environment                 = "prod"
aws_region                  = "ap-northeast-1"
account_id                  = "353666332910"
primary_frontend_bucket_key = "frontend"
primary_lambda_key          = "guidance"

frontend_buckets = {
  frontend = {
    bucket_name             = "twilio-flow-custom-parts-cicd-test-prod-front-353666332910"
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
    public_read_enabled     = true
    index_document          = "index.html"
  }
}

lambdas = {
  guidance = {
    function_name = "GuidanceHandler-cicd-test-prod"
  }
}