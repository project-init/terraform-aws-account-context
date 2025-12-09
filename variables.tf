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
