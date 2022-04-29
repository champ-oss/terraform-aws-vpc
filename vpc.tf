resource "aws_vpc" "this" {
  cidr_block           = "${var.cidr_block}/${var.cidr_size}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge({ Name : var.git }, local.tags, var.tags)
}

resource "aws_vpc_dhcp_options" "this" {
  domain_name         = "${data.aws_region.this.name}.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags                = merge({ Name : var.git }, local.tags, var.tags)
}

resource "aws_vpc_dhcp_options_association" "this" {
  vpc_id          = aws_vpc.this.id
  dhcp_options_id = aws_vpc_dhcp_options.this.id
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge({ Name : var.git }, local.tags, var.tags)
}

resource "aws_flow_log" "this" {
  iam_role_arn    = aws_iam_role.this.arn
  log_destination = aws_cloudwatch_log_group.this.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.this.id
  tags            = merge({ Name : var.git }, local.tags, var.tags)
}