terraform {
  backend "s3" {
    bucket = "s3-backend-practical"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}