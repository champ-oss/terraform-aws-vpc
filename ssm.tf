resource "aws_ssm_parameter" "this" {
  count = var.shared ? 1 : 0
  name  = "${var.discovery_path}/${local.vpc_id}"
  type  = "String"
  value = local.vpc_id
}
