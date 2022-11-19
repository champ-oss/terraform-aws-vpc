output "vpc_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#id"
  value       = local.vpc_id
}

output "cidr_block" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#cidr_block"
  value       = local.discovered ? null : aws_vpc.this[0].cidr_block
}

output "all_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = local.discovered ? null : flatten([aws_subnet.public[*].id, aws_subnet.private[*].id])
}

output "public_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = local.discovered ? null : aws_subnet.public[*].id
}

output "private_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = local.discovered ? null : aws_subnet.private[*].id
}

output "all_route_table_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = local.discovered ? null : flatten([aws_route_table.public[0].id, aws_route_table.private[*].id])
}

output "public_route_table_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = local.discovered ? null : aws_route_table.public[0].id
}

output "private_route_table_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = local.discovered ? null : aws_route_table.private[*].id
}

output "nat_public_ips" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip#public_ip"
  value       = local.discovered ? null : aws_eip.this[*].public_ip
}
