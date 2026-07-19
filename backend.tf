terraform {
  backend "s3" {
    bucket = "terraform-db-pipeline-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}