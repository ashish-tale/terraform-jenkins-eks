terraform {
  backend "s3" {
    bucket = "s3-backend-practical"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}