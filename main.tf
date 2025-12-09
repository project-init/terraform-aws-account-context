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
  public_subnets             = var.public_subnet_ids == "" ? split(",", data.aws_ssm_parameter.public_subnets[0].insecure_value) : var.public_subnet_ids
  private_subnets_param_name = "/account-context/${var.aws_account_name}/network/private_subnets"
  private_subnets            = var.private_subnet_ids == "" ? split(",", data.aws_ssm_parameter.private_subnets[0].insecure_value) : var.private_subnet_ids
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
  count = var.public_subnet_ids == [] ? 1 : 0
  name  = local.public_subnets_param_name
}

resource "aws_ssm_parameter" "public_subnets" {
  count = var.public_subnet_ids != null && var.public_subnet_ids != [] ? 1 : 0

  name  = local.public_subnets_param_name
  type  = "StringList"
  value = join(",", local.public_subnets)
}

data "aws_ssm_parameter" "private_subnets" {
  count = var.private_subnet_ids == [] ? 1 : 0
  name  = local.private_subnets_param_name
}

resource "aws_ssm_parameter" "private_subnets" {
  count = var.private_subnet_ids != null && var.private_subnet_ids != [] ? 1 : 0

  name  = local.private_subnets_param_name
  type  = "StringList"
  value = join(",", local.private_subnets)
}