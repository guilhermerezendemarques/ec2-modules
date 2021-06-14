terraform {
  required_version = ">= 0.15.0"

  backend "s3" {
    bucket  = "481354374900-tf"
    key     = "481354374900-tf.tfstate"
    region  = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  allowed_account_ids = ["481354374900"]

}
