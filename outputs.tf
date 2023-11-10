output "vpc_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#id"
  value       = aws_vpc.this[0].id
}

output "cidr_block" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#cidr_block"
  value       = aws_vpc.this[0].cidr_block
}

output "all_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = flatten([aws_subnet.public[*].id, aws_subnet.private[*].id])
}

output "all_subnets_arns" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#arn"
  value       = flatten([aws_subnet.public[*].arn, aws_subnet.private[*].arn])
}

output "public_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = aws_subnet.public[*].id
}

output "public_subnets_arns" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#arn"
  value       = aws_subnet.public[*].arn
}

output "private_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = aws_subnet.private[*].id
}

output "private_subnets_arns" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#arn"
  value       = aws_subnet.private[*].arn
}

output "all_route_table_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = flatten([aws_route_table.public[0].id, aws_route_table.private[*].id])
}

output "all_route_table_arns" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#arn"
  value       = flatten([aws_route_table.public[0].arn, aws_route_table.private[*].arn])
}

output "public_route_table_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = aws_route_table.public[0].id
}

output "public_route_table_arn" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#arn"
  value       = aws_route_table.public[0].arn
}

output "private_route_table_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = aws_route_table.private[*].id
}

output "private_route_table_arns" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#arn"
  value       = aws_route_table.private[*].arn
}

output "nat_public_ips" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip#public_ip"
  value       = aws_eip.this[*].public_ip
}

output "transit_gateway_vpc_attachment_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment"
  value       = var.enable_transit_gateway_attachment && !local.discovered ? aws_ec2_transit_gateway_vpc_attachment.this[0].id : null
}
