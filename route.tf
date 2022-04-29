resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags   = merge({ Name : "${var.git}-public" }, { Type : "Public" }, local.tags, var.tags)
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
  count          = var.availability_zones_count
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  count  = var.availability_zones_count
  vpc_id = aws_vpc.this.id
  tags   = merge({ Name : "${var.git}-private-${count.index}" }, { Type : "Private" }, local.tags, var.tags)
}

resource "aws_route" "private" {
  count                  = var.availability_zones_count
  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.this.*.id, count.index)
}

resource "aws_route_table_association" "private" {
  count          = var.availability_zones_count
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}