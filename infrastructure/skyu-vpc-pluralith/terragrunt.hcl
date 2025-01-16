
terraform {
  source = "${get_terragrunt_dir()}"
}

remote_state {
  backend = "s3"
  config = {
    bucket  = "project-aaeb30aa-5edd-4e8e-87c5-e67876a86daa-us-east-1"
    key     = "skyu-vpc-pluralith/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    dynamodb_table = "project-aaeb30aa-5edd-4e8e-87c5-e67876a86daa-us-east-1"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF

terraform {
  backend "s3" {
    bucket  = "project-aaeb30aa-5edd-4e8e-87c5-e67876a86daa-us-east-1"
    key     = "project-aaeb30aa-5edd-4e8e-87c5-e67876a86daa-us-east-1/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    dynamodb_table = "project-aaeb30aa-5edd-4e8e-87c5-e67876a86daa-us-east-1"
  }
}
EOF
}

inputs = {
  availability_zones = ["us-east-1a","us-east-1b"]
  cidr = "10.10.0.0/28"
  create_database_subnet_group = "true"
  database_subnet_tags = {"type":"db"}
  database_subnets = ["10.10.21.0/24","10.10.22.0/24","10.10.23.0/24"]
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
  enable_nat_gateway = "false"
  enable_vpn_gateway = "false"
  name = "skyu-vpc-pluralith"
  private_subnet_tags = {"type":"private"}
  private_subnets = ["10.10.1.0/24","10.10.2.0/24","10.10.3.0/24"]
  public_subnet_tags = {"type":"public"}
  public_subnets = ["10.10.11.0/24","10.10.12.0/24","10.10.13.0/24"]
  single_nat_gateway = "false"
  tags = {"Name":"skyu-vpc-pluralith","app":"skyu","env":"sbx","organization":"insighture","owner":"januda.b@insighture.com","project":"skyu","scope":"core"}
}
