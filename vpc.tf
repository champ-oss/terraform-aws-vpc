# tflint-ignore: terraform_comment_syntax
//noinspection ConflictingProperties
resource "aws_vpc" "this" {
  count                = 1
  cidr_block           = var.ipv4_ipam_pool_id == null ? "${var.cidr_block}/${var.cidr_size}" : null
  enable_dns_support   = true
  enable_dns_hostnames = true
  ipv4_ipam_pool_id    = var.ipv4_ipam_pool_id
  ipv4_netmask_length  = var.ipv4_netmask_length
  tags                 = merge({ Name : var.name }, local.tags, var.tags)
}

resource "aws_vpc_dhcp_options" "this" {
  count               = 1
  domain_name         = "${data.aws_region.this.name}.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags                = merge({ Name : var.name }, local.tags, var.tags)
}

resource "aws_vpc_dhcp_options_association" "this" {
  count           = 1
  vpc_id          = aws_vpc.this[0].id
  dhcp_options_id = aws_vpc_dhcp_options.this[0].id
}

resource "aws_internet_gateway" "this" {
  count  = 1
  vpc_id = aws_vpc.this[0].id
  tags   = merge({ Name : var.name }, local.tags, var.tags)
}

resource "aws_flow_log" "this" {
  count           = 1
  iam_role_arn    = aws_iam_role.this[0].arn
  log_destination = aws_cloudwatch_log_group.this[0].arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.this[0].id
  tags            = merge({ Name : var.name }, local.tags, var.tags)
}