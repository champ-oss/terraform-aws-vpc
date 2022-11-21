resource "aws_ssm_parameter" "this" {
  count = var.shared ? 1 : 0
  name  = "${var.discovery_path}/${aws_vpc.this[0].id}"
  type  = "String"
  value = aws_vpc.this[0].id
}
