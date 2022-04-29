data "aws_region" "this" {}

data "aws_availability_zones" "this" {}

locals {
  tags = {
    git       = var.git
    cost      = "shared"
    creator   = "terraform"
    component = "vpc"
  }
}