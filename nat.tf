resource "aws_eip" "this" {
  count = var.availability_zones_count
  tags  = merge({ Name : "${var.git}-nat-${count.index}" }, { Type : "NAT" }, local.tags, var.tags)
}

resource "aws_nat_gateway" "this" {
  count         = var.availability_zones_count
  allocation_id = element(aws_eip.this.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  tags          = merge({ Name : "${var.git}-${count.index}" }, local.tags, var.tags)
}