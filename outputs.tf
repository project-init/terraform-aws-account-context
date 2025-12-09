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
  value       = local.domain
  description = "The main domain for the account."
}

output "hosted_zone_id" {
  value       = local.hosted_zone_id
  description = "The main Hosted Zone ID for the account."
}

########################################################################################################################
### ECS
########################################################################################################################

output "ecs_cluster_name" {
  value       = local.ecs_cluster_name
  description = "The name of the ecs cluster used in the account."
}

output "ecs_cluster_arn" {
  value       = local.ecs_cluster_arn
  description = "The ARN of the ecs cluster used in the account."
}

output "ecs_cluster_role_arn" {
  value       = local.ecs_cluster_role_arn
  description = "The ARN of the ecs cluster role used in the account."
}

output "ecs_cluster_capacity_provider" {
  value       = local.ecs_cluster_capacity_provider
  description = "The Capacity Provider of the ecs cluster role used in the account. Only needed for ec2 backed ecs clusters."
}