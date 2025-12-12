########################################################################################################################
### Common
########################################################################################################################

variable "aws_account_name" {
  type        = string
  description = "The AWS Account Name to store the context of."
}

########################################################################################################################
### Account
########################################################################################################################

variable "account_id" {
  type        = string
  nullable    = true
  default     = null
  description = "The ID for the account."
}

########################################################################################################################
### Networking
########################################################################################################################

variable "vpc_id" {
  type        = string
  nullable    = true
  default     = null
  description = "The VPC ID for the account."
}

variable "ipv4_cidr_block" {
  type        = string
  nullable    = true
  default     = null
  description = "The VPC CIDR Block (IPv4) for the account."
}

variable "public_subnet_ids" {
  type        = list(string)
  nullable    = true
  default     = null
  description = "The IDs for the public subnets."
}

variable "private_subnet_ids" {
  type        = list(string)
  nullable    = true
  default     = null
  description = "The IDs for the private subnets."
}

########################################################################################################################
### Domain/Route53
########################################################################################################################

variable "domain" {
  type        = string
  nullable    = true
  default     = null
  description = "The main domain for the account."
}

variable "hosted_zone_id" {
  type        = string
  nullable    = true
  default     = null
  description = "The main Hosted Zone ID for the account."
}

########################################################################################################################
### ECS
########################################################################################################################

variable "ecs_cluster_name" {
  type        = string
  nullable    = true
  default     = null
  description = "The name of the ecs cluster used in the account."
}

variable "ecs_cluster_arn" {
  type        = string
  nullable    = true
  default     = null
  description = "The ARN of the ecs cluster used in the account."
}

variable "ecs_cluster_capacity_provider" {
  type        = string
  nullable    = true
  default     = null
  description = "The Capacity Provider of the ecs cluster role used in the account. Only needed for ec2 backed ecs clusters."
}

########################################################################################################################
### Traffic Management
########################################################################################################################

variable "internal_lb_name" {
  type        = string
  nullable    = true
  default     = null
  description = "The name of the internal load balancer."
}

variable "internal_lb_dns_name" {
  type        = string
  nullable    = true
  default     = null
  description = "The DNS Name of the internal load balancer."
}

variable "internal_lb_zone_id" {
  type        = string
  nullable    = true
  default     = null
  description = "The Zone ID of the internal load balancer."
}

variable "internal_lb_security_group_id" {
  type        = string
  nullable    = true
  default     = null
  description = "The ID of the internal load balancer's security group."
}

variable "internal_lb_https_listener_arn" {
  type        = string
  nullable    = true
  default     = null
  description = "The ARN of the internal load balancer's https listener."
}

variable "internal_lb_https_prelive_listener_arn" {
  type        = string
  nullable    = true
  default     = null
  description = "The ARN of the internal load balancer's prelive https listener."
}

########################################################################################################################
### VPN
########################################################################################################################

variable "vpn_security_group_id" {
  type        = string
  nullable    = true
  default     = null
  description = "The ID of the security group for the VPN."
}