resource "aws_vpc" "this" {
  count                = local.discovered ? 0 : 1
  cidr_block           = "${var.cidr_block}/${var.cidr_size}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge({ Name : var.name }, local.tags, var.tags)
}

resource "aws_vpc_dhcp_options" "this" {
  count               = local.discovered ? 0 : 1
  domain_name         = "${data.aws_region.this.name}.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags                = merge({ Name : var.name }, local.tags, var.tags)
}

resource "aws_vpc_dhcp_options_association" "this" {
  count           = local.discovered ? 0 : 1
  vpc_id          = aws_vpc.this[0].id
  dhcp_options_id = aws_vpc_dhcp_options.this[0].id
}

resource "aws_internet_gateway" "this" {
  count  = local.discovered ? 0 : 1
  vpc_id = aws_vpc.this[0].id
  tags   = merge({ Name : var.name }, local.tags, var.tags)
}

resource "aws_flow_log" "this" {
  count           = local.discovered ? 0 : 1
  iam_role_arn    = aws_iam_role.this[0].arn
  log_destination = aws_cloudwatch_log_group.this[0].arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.this[0].id
  tags            = merge({ Name : var.name }, local.tags, var.tags)
}