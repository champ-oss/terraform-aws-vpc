data "aws_region" "this" {}

data "aws_availability_zones" "this" {}

locals {
  tags = {
    git       = var.name
    cost      = "shared"
    creator   = "terraform"
    component = "vpc"
  }
}