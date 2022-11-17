resource "aws_cloudwatch_log_group" "this" {
  name_prefix       = "${var.name}-vpc-flow-logs-"
  retention_in_days = var.retention_in_days
  tags              = merge(local.tags, var.tags)
}