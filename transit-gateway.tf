resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  count              = var.enable_transit_gateway_attachment && !local.discovered ? 1 : 0
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = aws_vpc.this.id
  subnet_ids         = aws_subnet.private[*].id
  tags               = merge({ Name : var.name }, local.tags, var.tags)
}