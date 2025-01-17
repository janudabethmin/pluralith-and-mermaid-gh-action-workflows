terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.4.0"
    }     
  }
}

module "vpc" {

  # source = "../../../../../modules/aws_modules/vpc_1.0.0"
  source = "../../modules/aws_modules/vpc_1.0.0"


  name = var.name

  cidr                = var.cidr
  private_subnets     = var.private_subnets
  public_subnets      = var.public_subnets
  database_subnets    = var.database_subnets

  azs = var.availability_zones

  create_database_subnet_group = var.create_database_subnet_group

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_vpn_gateway = var.enable_vpn_gateway
  amazon_side_asn    = var.amazon_side_asn

  tags = var.tags

  public_subnet_tags = merge({"type" = "public"}, var.public_subnet_tags)
  private_subnet_tags = merge({"type" = "private"}, var.private_subnet_tags)
  database_subnet_tags = merge({"type" = "db"}, var.database_subnet_tags)
  public_route_table_tags  = var.public_route_table_tags
  private_route_table_tags = var.private_route_table_tags

}
