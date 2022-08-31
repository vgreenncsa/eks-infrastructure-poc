# tf_backend.tf
terraform {
  backend "s3" {
    bucket         = "BUCKET"
    key            = "BUCKET/dev/tf.state"
    region         = "us-east-2"
    dynamodb_table = "BUCKET"
  }
}