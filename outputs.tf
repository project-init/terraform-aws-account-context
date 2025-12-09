########################################################################################################################
### Account
########################################################################################################################

output "account_id" {
  value       = local.account_id
  description = "The ID of the AWS account."
}

########################################################################################################################
### Networking
########################################################################################################################

output "vpc_id" {
  value       = local.vpc_id
  description = "The ID of the VPC for the account."
}

output "ipv4_cidr_block" {
  value       = local.ipv4_cidr_block
  description = "The VPC CIDR Block (IPv4) for the account."
}

output "public_subnet_ids" {
  value       = local.public_subnets
  description = "The IDs for the public subnets."
}

output "private_subnet_ids" {
  value       = local.private_subnets
  description = "The IDs for the private subnets."
}

########################################################################################################################
### Domain/Route53
########################################################################################################################

output "domain" {
  description = "The main domain for the account."
}

output "hosted_zone_id" {
  description = "The main Hosted Zone ID for the account."
}