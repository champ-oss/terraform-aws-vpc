locals {
  discovered = length(data.aws_ssm_parameters_by_path.this.names) == 1 && !var.shared
  vpc_id     = local.discovered ? data.aws_ssm_parameters_by_path.this[0].values[0] : aws_vpc.this[0].id

  tags = {
    git       = var.name
    cost      = "shared"
    creator   = "terraform"
    component = "vpc"
  }
}