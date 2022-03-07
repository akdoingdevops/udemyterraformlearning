terraform {
  backend "s3" {
    bucket = "tflstate"
    key    = "terraform/demo-4"
    region = "ap-south-1"
    // dynamodb_table = "terraformstate.lock"
    encrypt = true
  }
}