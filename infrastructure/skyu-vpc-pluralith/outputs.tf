output "awsvpc_vpc_id_vpc" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "awsvpc_cidrblock_id_vpccidrblock" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "awsvpc_securitygroup_id_default_security_group" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.vpc.default_security_group_id
}

output "awsvpc_networkacl_id_default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = module.vpc.default_network_acl_id
}

output "awsvpc_subnets_id_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "awsvpc_subnetscidrblocks_id_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "awsvpc_subnets_id_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "awsvpc_subnetscidrblocks_id_public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "awsvpc_subnets_id_database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "awsvpc_subnets_id_database_subnet_group" {
  description = "ID of database subnet group"
  value       = module.vpc.database_subnet_group
}
