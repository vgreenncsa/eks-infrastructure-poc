# remote state
/*
data "terraform_remote_state" "remote_state" {
  backend = "s3"

  config = {
    bucket = "BUCKET"
    key    = "BUCKET/dev/tf.state"
    region = "us-east-2"
  }
}

*/
#-----------------------------------------------------------------------------------------------------