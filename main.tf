locals {
  # Account
  account_id_param_name = "/account-context/${var.aws_account_name}/account/id"
  account_id            = var.account_id == "" ? data.aws_ssm_parameter.account_id[0].insecure_value : var.account_id

  # Networking
  vpc_id_param_name          = "/account-context/${var.aws_account_name}/network/vpc/id"
  vpc_id                     = var.vpc_id == "" ? data.aws_ssm_parameter.vpc_id[0].insecure_value : var.vpc_id
  ipv4_cidr_block_param_name = "/account-context/${var.aws_account_name}/network/vpc/ipv4_cidr_block"
  ipv4_cidr_block            = var.ipv4_cidr_block == "" ? data.aws_ssm_parameter.ipv4_cidr_block[0].insecure_value : var.ipv4_cidr_block
  public_subnets_param_name  = "/account-context/${var.aws_account_name}/network/public_subnets"
  public_subnets             = var.public_subnet_ids != null && length(var.public_subnet_ids) == 0 ? split(",", data.aws_ssm_parameter.public_subnets[0].insecure_value) : var.public_subnet_ids
  private_subnets_param_name = "/account-context/${var.aws_account_name}/network/private_subnets"
  private_subnets            = var.private_subnet_ids != null && length(var.private_subnet_ids) == 0 ? split(",", data.aws_ssm_parameter.private_subnets[0].insecure_value) : var.private_subnet_ids

  # Domain
  domain_param_name         = "/account-context/${var.aws_account_name}/domain/name"
  domain                    = var.domain == "" ? data.aws_ssm_parameter.domain[0].insecure_value : var.domain
  hosted_zone_id_param_name = "/account-context/${var.aws_account_name}/domain/hosted_zone_id"
  hosted_zone_id            = var.hosted_zone_id == "" ? data.aws_ssm_parameter.hosted_zone_id[0].insecure_value : var.hosted_zone_id

  # ECS
  ecs_cluster_name_param_name              = "/account-context/${var.aws_account_name}/ecs/cluster/name"
  ecs_cluster_name                         = var.ecs_cluster_name == "" ? data.aws_ssm_parameter.ecs_cluster_name[0].insecure_value : var.ecs_cluster_name
  ecs_cluster_arn_param_name               = "/account-context/${var.aws_account_name}/ecs/cluster/arn"
  ecs_cluster_arn                          = var.ecs_cluster_arn == "" ? data.aws_ssm_parameter.ecs_cluster_arn[0].insecure_value : var.ecs_cluster_arn
  ecs_cluster_capacity_provider_param_name = "/account-context/${var.aws_account_name}/ecs/cluster/capacity_provider"
  ecs_cluster_capacity_provider            = var.ecs_cluster_capacity_provider == "" ? data.aws_ssm_parameter.ecs_cluster_capacity_provider[0].insecure_value : var.ecs_cluster_capacity_provider

  # Traffic Management
  internal_lb_name_param_name               = "/account-context/${var.aws_account_name}/traffic-management/load-balancer/internal/name"
  internal_lb_name                          = var.internal_lb_name == "" ? data.aws_ssm_parameter.internal_lb_name[0].insecure_value : var.internal_lb_name
  internal_lb_dns_name_param_name           = "/account-context/${var.aws_account_name}/traffic-management/load-balancer/internal/dns_name"
  internal_lb_dns_name                      = var.internal_lb_dns_name == "" ? data.aws_ssm_parameter.internal_lb_dns_name[0].insecure_value : var.internal_lb_dns_name
  internal_lb_zone_id_param_name            = "/account-context/${var.aws_account_name}/traffic-management/load-balancer/internal/zone_id"
  internal_lb_zone_id                       = var.internal_lb_zone_id == "" ? data.aws_ssm_parameter.internal_lb_zone_id[0].insecure_value : var.internal_lb_zone_id
  internal_lb_security_group_id_param_name  = "/account-context/${var.aws_account_name}/traffic-management/load-balancer/internal/security_group_id"
  internal_lb_security_group_id             = var.internal_lb_security_group_id == "" ? data.aws_ssm_parameter.internal_lb_security_group_id[0].insecure_value : var.internal_lb_security_group_id
  internal_lb_https_listener_arn_param_name = "/account-context/${var.aws_account_name}/traffic-management/load-balancer/internal/https_listener_arn"
  internal_lb_https_listener_arn            = var.internal_lb_https_listener_arn == "" ? data.aws_ssm_parameter.internal_lb_https_listener_arn[0].insecure_value : var.internal_lb_https_listener_arn
}

########################################################################################################################
### Account
########################################################################################################################

data "aws_ssm_parameter" "account_id" {
  count = var.account_id == "" ? 1 : 0
  name  = local.account_id_param_name
}

resource "aws_ssm_parameter" "account_id" {
  count = var.account_id != null && var.account_id != "" ? 1 : 0

  name  = local.account_id_param_name
  type  = "String"
  value = local.account_id
}

########################################################################################################################
### Networking
########################################################################################################################

data "aws_ssm_parameter" "vpc_id" {
  count = var.vpc_id == "" ? 1 : 0
  name  = local.vpc_id_param_name
}

resource "aws_ssm_parameter" "vpc_id" {
  count = var.vpc_id != null && var.vpc_id != "" ? 1 : 0

  name  = local.vpc_id_param_name
  type  = "String"
  value = local.vpc_id
}

data "aws_ssm_parameter" "ipv4_cidr_block" {
  count = var.ipv4_cidr_block == "" ? 1 : 0
  name  = local.ipv4_cidr_block_param_name
}

resource "aws_ssm_parameter" "ipv4_cidr_block" {
  count = var.ipv4_cidr_block != null && var.ipv4_cidr_block != "" ? 1 : 0

  name  = local.ipv4_cidr_block_param_name
  type  = "String"
  value = local.ipv4_cidr_block
}

data "aws_ssm_parameter" "public_subnets" {
  count = var.public_subnet_ids == null || length(var.public_subnet_ids) == 0 ? 1 : 0
  name  = local.public_subnets_param_name
}

resource "aws_ssm_parameter" "public_subnets" {
  count = var.public_subnet_ids != null && length(var.public_subnet_ids) > 0 ? 1 : 0

  name  = local.public_subnets_param_name
  type  = "StringList"
  value = join(",", local.public_subnets)
}

data "aws_ssm_parameter" "private_subnets" {
  count = var.private_subnet_ids == null || length(var.private_subnet_ids) == 0 ? 1 : 0
  name  = local.private_subnets_param_name
}

resource "aws_ssm_parameter" "private_subnets" {
  count = var.private_subnet_ids != null && length(var.private_subnet_ids) > 0 ? 1 : 0

  name  = local.private_subnets_param_name
  type  = "StringList"
  value = join(",", local.private_subnets)
}

########################################################################################################################
### Domain
########################################################################################################################

data "aws_ssm_parameter" "domain" {
  count = var.domain == "" ? 1 : 0
  name  = local.domain_param_name
}

resource "aws_ssm_parameter" "domain" {
  count = var.domain != null && var.domain != "" ? 1 : 0

  name  = local.domain_param_name
  type  = "String"
  value = local.domain
}

data "aws_ssm_parameter" "hosted_zone_id" {
  count = var.hosted_zone_id == "" ? 1 : 0
  name  = local.hosted_zone_id_param_name
}

resource "aws_ssm_parameter" "hosted_zone_id" {
  count = var.hosted_zone_id != null && var.hosted_zone_id != "" ? 1 : 0

  name  = local.hosted_zone_id_param_name
  type  = "String"
  value = local.hosted_zone_id
}

########################################################################################################################
### ECS
########################################################################################################################

data "aws_ssm_parameter" "ecs_cluster_name" {
  count = var.ecs_cluster_name == "" ? 1 : 0
  name  = local.ecs_cluster_name_param_name
}

resource "aws_ssm_parameter" "ecs_cluster_name" {
  count = var.ecs_cluster_name != null && var.ecs_cluster_name != "" ? 1 : 0

  name  = local.ecs_cluster_name_param_name
  type  = "String"
  value = local.ecs_cluster_name
}

data "aws_ssm_parameter" "ecs_cluster_arn" {
  count = var.ecs_cluster_arn == "" ? 1 : 0
  name  = local.ecs_cluster_arn_param_name
}

resource "aws_ssm_parameter" "ecs_cluster_arn" {
  count = var.ecs_cluster_arn != null && var.ecs_cluster_arn != "" ? 1 : 0

  name  = local.ecs_cluster_arn_param_name
  type  = "String"
  value = local.ecs_cluster_arn
}

data "aws_ssm_parameter" "ecs_cluster_capacity_provider" {
  count = var.ecs_cluster_capacity_provider == "" ? 1 : 0
  name  = local.ecs_cluster_capacity_provider_param_name
}

resource "aws_ssm_parameter" "ecs_cluster_capacity_provider" {
  count = var.ecs_cluster_capacity_provider != null && var.ecs_cluster_capacity_provider != "" ? 1 : 0

  name  = local.ecs_cluster_capacity_provider_param_name
  type  = "String"
  value = local.ecs_cluster_capacity_provider
}

########################################################################################################################
### Traffic Management
########################################################################################################################

data "aws_ssm_parameter" "internal_lb_name" {
  count = var.internal_lb_name == "" ? 1 : 0
  name  = local.internal_lb_name_param_name
}

resource "aws_ssm_parameter" "internal_lb_name" {
  count = var.internal_lb_name != null && var.internal_lb_name != "" ? 1 : 0

  name  = local.internal_lb_name_param_name
  type  = "String"
  value = local.internal_lb_name
}

data "aws_ssm_parameter" "internal_lb_dns_name" {
  count = var.internal_lb_dns_name == "" ? 1 : 0
  name  = local.internal_lb_dns_name_param_name
}

resource "aws_ssm_parameter" "internal_lb_dns_name" {
  count = var.internal_lb_dns_name != null && var.internal_lb_dns_name != "" ? 1 : 0

  name  = local.internal_lb_dns_name_param_name
  type  = "String"
  value = local.internal_lb_dns_name
}

data "aws_ssm_parameter" "internal_lb_zone_id" {
  count = var.internal_lb_zone_id == "" ? 1 : 0
  name  = local.internal_lb_zone_id_param_name
}

resource "aws_ssm_parameter" "internal_lb_zone_id" {
  count = var.internal_lb_zone_id != null && var.internal_lb_zone_id != "" ? 1 : 0

  name  = local.internal_lb_zone_id_param_name
  type  = "String"
  value = local.internal_lb_zone_id
}

data "aws_ssm_parameter" "internal_lb_security_group_id" {
  count = var.internal_lb_security_group_id == "" ? 1 : 0
  name  = local.internal_lb_security_group_id_param_name
}

resource "aws_ssm_parameter" "internal_lb_security_group_id" {
  count = var.internal_lb_security_group_id != null && var.internal_lb_security_group_id != "" ? 1 : 0

  name  = local.internal_lb_security_group_id_param_name
  type  = "String"
  value = local.internal_lb_security_group_id
}

data "aws_ssm_parameter" "internal_lb_https_listener_arn" {
  count = var.internal_lb_https_listener_arn == "" ? 1 : 0
  name  = local.internal_lb_https_listener_arn_param_name
}

resource "aws_ssm_parameter" "internal_lb_https_listener_arn" {
  count = var.internal_lb_https_listener_arn != null && var.internal_lb_https_listener_arn != "" ? 1 : 0

  name  = local.internal_lb_https_listener_arn_param_name
  type  = "String"
  value = local.internal_lb_https_listener_arn
}