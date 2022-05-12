provider "aws" {
  region = "us-east-1"
}

module "this" {
  source                   = "../../"
  git                      = "terraform-aws-vpc"
  cidr_block               = "10.0.0.0"
  cidr_size                = 20
  availability_zones_count = 2
  retention_in_days        = 1
}

module "public" {
  source                   = "../../"
  git                      = "terraform-aws-vpc"
  cidr_block               = "10.0.0.0"
  cidr_size                = 20
  availability_zones_count = 2
  retention_in_days        = 1
  create_private_subnets   = false
}