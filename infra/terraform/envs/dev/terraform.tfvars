project                     = "cicd-test"
environment                 = "dev"
aws_region                  = "ap-northeast-1"
account_id                  = "237710157750"
primary_frontend_bucket_key = "frontend"
primary_lambda_key          = "guidance"

frontend_buckets = {
  frontend = {
    bucket_name             = "twilio-flow-custom-parts-cicd-test-dev-front-237710157750"
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
    function_name = "GuidanceHandler-cicd-test-dev"
  }
}