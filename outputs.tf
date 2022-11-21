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

output "public_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = aws_subnet.public[*].id
}

output "private_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = aws_subnet.private[*].id
}

output "all_route_table_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = flatten([aws_route_table.public[0].id, aws_route_table.private[*].id])
}

output "public_route_table_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = aws_route_table.public[0].id
}

output "private_route_table_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = aws_route_table.private[*].id
}

output "nat_public_ips" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip#public_ip"
  value       = aws_eip.this[*].public_ip
}
