locals {
  azs_availability = ["0", "1"]
  vpc-name         = "dooca"
  vpc-cidrblock    = "172.23.80.0/20"

  tags = {
    terraform-aws-devops = element(split("/", data.aws_caller_identity.current.arn), 2)
  }
}