resource "aws_route_table" "public" {
  count  = 1
  vpc_id = aws_vpc.this[0].id
  tags   = merge({ Name : "${var.name}-public" }, { Type : "Public" }, local.tags, var.tags)
}

resource "aws_route" "public" {
  count                  = 1
  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id
}

resource "aws_route_table_association" "public" {
  count          = var.availability_zones_count
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public[0].id
}

resource "aws_route_table" "private" {
  count  = var.create_private_subnets ? var.availability_zones_count : 0
  vpc_id = aws_vpc.this[0].id
  tags   = merge({ Name : "${var.name}-private-${count.index}" }, { Type : "Private" }, local.tags, var.tags)
}

resource "aws_route" "private" {
  count                  = var.create_private_subnets ? var.availability_zones_count : 0
  route_table_id         = element(aws_route_table.private[*].id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.create_nat_gw ? element(aws_nat_gateway.this[*].id, count.index) : null
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route_table_association" "private" {
  count          = var.create_private_subnets ? var.availability_zones_count : 0
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, count.index)
}