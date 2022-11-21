data "aws_region" "this" {}
data "aws_availability_zones" "this" {}

data "aws_ssm_parameters_by_path" "this" {
  path = var.discovery_path
}
