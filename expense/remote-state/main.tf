terraform {
  backend "s3" {
    bucket = "d76-terraform-state-chinni"
    key    = "test/terraform.tfstate"
    region = "us-east-1"
  }
}
