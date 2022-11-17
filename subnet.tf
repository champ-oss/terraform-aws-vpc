resource "aws_subnet" "public" {
  count             = var.availability_zones_count
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet("${var.cidr_block}/${var.cidr_size}", var.subnet_size, count.index)
  availability_zone = data.aws_availability_zones.this.names[count.index]
  tags              = merge({ Name : "${var.name}-public-${count.index}" }, {
    Type : "Public"
  }, local.tags, var.tags, var.public_subnet_tags)
}

resource "aws_subnet" "private" {
  count             = var.create_private_subnets ? var.availability_zones_count : 0
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet("${var.cidr_block}/${var.cidr_size}", var.subnet_size, count.index + length(data.aws_availability_zones.this.names))
  availability_zone = data.aws_availability_zones.this.names[count.index]
  tags              = merge({ Name : "${var.name}-private-${count.index}" }, {
    Type : "Private"
  }, local.tags, var.tags, var.private_subnet_tags)
}