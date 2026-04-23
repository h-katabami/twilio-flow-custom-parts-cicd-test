terraform {
  backend "s3" {
    bucket = "cicd-state-dev-237710157750"
    key    = "state/twilio-flow-custom-parts-cicd-test/dev/terraform.tfstate"
    region = "ap-northeast-1"
  }
}