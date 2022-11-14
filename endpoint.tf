resource "aws_vpc_endpoint" "s3" {
  count             = var.create_private_subnets ? 1 : 0
  vpc_endpoint_type = "Gateway"
  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.${data.aws_region.this.name}.s3"
  route_table_ids   = aws_route_table.private[*].id
  tags              = merge({ Name : "${var.git}-s3" }, local.tags, var.tags)
}