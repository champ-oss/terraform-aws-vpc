locals {
  tags = {
    git       = var.name
    cost      = "shared"
    creator   = "terraform"
    component = "vpc"
  }
}