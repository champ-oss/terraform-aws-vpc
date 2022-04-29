output "all_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = module.this.all_subnets_ids
}

output "public_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = module.this.public_subnets_ids
}

output "private_subnets_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#id"
  value       = module.this.private_subnets_ids
}

output "all_route_table_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = module.this.all_route_table_ids
}

output "private_route_table_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#id"
  value       = module.this.private_route_table_ids
}

output "nat_public_ips" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip#public_ip"
  value       = module.this.nat_public_ips
}

