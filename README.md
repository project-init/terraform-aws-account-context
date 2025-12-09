# Project Init AWS Account Context

Module used to help manage context about the AWS Account in a way all services can access it in a read only capacity.

## Quick Start

1. `mise format`
2. `mise docs`

## Usage

Check our [Examples](examples) for full usage information.

## Useful Docs

* [Code of Conduct](./CODE_OF_CONDUCT.md)
* [Contribution Guide](./CONTRIBUTING.md)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.81.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.81.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.account_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.ecs_cluster_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.ecs_cluster_capacity_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.ecs_cluster_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.hosted_zone_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.internal_lb_dns_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.internal_lb_https_listener_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.internal_lb_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.internal_lb_security_group_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.internal_lb_zone_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.ipv4_cidr_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.vpc_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.account_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.ecs_cluster_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.ecs_cluster_capacity_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.ecs_cluster_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.hosted_zone_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.internal_lb_dns_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.internal_lb_https_listener_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.internal_lb_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.internal_lb_security_group_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.internal_lb_zone_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.ipv4_cidr_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.vpc_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The ID for the account. | `string` | `null` | no |
| <a name="input_aws_account_name"></a> [aws\_account\_name](#input\_aws\_account\_name) | The AWS Account Name to store the context of. | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | The main domain for the account. | `string` | `null` | no |
| <a name="input_ecs_cluster_arn"></a> [ecs\_cluster\_arn](#input\_ecs\_cluster\_arn) | The ARN of the ecs cluster used in the account. | `string` | `null` | no |
| <a name="input_ecs_cluster_capacity_provider"></a> [ecs\_cluster\_capacity\_provider](#input\_ecs\_cluster\_capacity\_provider) | The Capacity Provider of the ecs cluster role used in the account. Only needed for ec2 backed ecs clusters. | `string` | `null` | no |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | The name of the ecs cluster used in the account. | `string` | `null` | no |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | The main Hosted Zone ID for the account. | `string` | `null` | no |
| <a name="input_internal_lb_dns_name"></a> [internal\_lb\_dns\_name](#input\_internal\_lb\_dns\_name) | The DNS Name of the internal load balancer. | `string` | `null` | no |
| <a name="input_internal_lb_https_listener_arn"></a> [internal\_lb\_https\_listener\_arn](#input\_internal\_lb\_https\_listener\_arn) | The ARN of the internal load balancer's https listener. | `string` | `null` | no |
| <a name="input_internal_lb_name"></a> [internal\_lb\_name](#input\_internal\_lb\_name) | The name of the internal load balancer. | `string` | `null` | no |
| <a name="input_internal_lb_security_group_id"></a> [internal\_lb\_security\_group\_id](#input\_internal\_lb\_security\_group\_id) | The ID of the internal load balancer's security group. | `string` | `null` | no |
| <a name="input_internal_lb_zone_id"></a> [internal\_lb\_zone\_id](#input\_internal\_lb\_zone\_id) | The Zone ID of the internal load balancer. | `string` | `null` | no |
| <a name="input_ipv4_cidr_block"></a> [ipv4\_cidr\_block](#input\_ipv4\_cidr\_block) | The VPC CIDR Block (IPv4) for the account. | `string` | `null` | no |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | The IDs for the private subnets. | `list(string)` | `null` | no |
| <a name="input_public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) | The IDs for the public subnets. | `list(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID for the account. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | The ID of the AWS account. |
| <a name="output_domain"></a> [domain](#output\_domain) | The main domain for the account. |
| <a name="output_ecs_cluster_arn"></a> [ecs\_cluster\_arn](#output\_ecs\_cluster\_arn) | The ARN of the ecs cluster used in the account. |
| <a name="output_ecs_cluster_capacity_provider"></a> [ecs\_cluster\_capacity\_provider](#output\_ecs\_cluster\_capacity\_provider) | The Capacity Provider of the ecs cluster role used in the account. Only needed for ec2 backed ecs clusters. |
| <a name="output_ecs_cluster_name"></a> [ecs\_cluster\_name](#output\_ecs\_cluster\_name) | The name of the ecs cluster used in the account. |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | The main Hosted Zone ID for the account. |
| <a name="output_internal_lb_dns_name"></a> [internal\_lb\_dns\_name](#output\_internal\_lb\_dns\_name) | The DNS Name of the internal load balancer. |
| <a name="output_internal_lb_https_listener_arn"></a> [internal\_lb\_https\_listener\_arn](#output\_internal\_lb\_https\_listener\_arn) | The ARN of the internal load balancer's https listener. |
| <a name="output_internal_lb_name"></a> [internal\_lb\_name](#output\_internal\_lb\_name) | The name of the internal load balancer. |
| <a name="output_internal_lb_security_group_id"></a> [internal\_lb\_security\_group\_id](#output\_internal\_lb\_security\_group\_id) | The ID of the internal load balancer's security group. |
| <a name="output_internal_lb_zone_id"></a> [internal\_lb\_zone\_id](#output\_internal\_lb\_zone\_id) | The Zone ID of the internal load balancer. |
| <a name="output_ipv4_cidr_block"></a> [ipv4\_cidr\_block](#output\_ipv4\_cidr\_block) | The VPC CIDR Block (IPv4) for the account. |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | The IDs for the private subnets. |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | The IDs for the public subnets. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC for the account. |
<!-- END_TF_DOCS -->