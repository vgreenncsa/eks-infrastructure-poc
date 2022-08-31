# tf_backend.tf
terraform {
  backend "s3" {
    bucket         = "ptc-ue2-ncsadev-eks-poc"
    key            = "ptc-ue2-ncsadev-eks-poc/dev/tf.state"
    region         = "us-east-2"
    dynamodb_table = "ptc-ue2-ncsadev-eks-poc"
  }
}