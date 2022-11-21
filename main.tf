locals {
  discovered = length(data.aws_ssm_parameters_by_path.this.names) == 1

  tags = {
    git       = var.name
    cost      = "shared"
    creator   = "terraform"
    component = "vpc"
  }
}