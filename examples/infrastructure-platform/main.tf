module "account_context" {
  source = "project-init/account-context/aws"
  # Project Init recommends pinning every module to a specific version
  # version = "vX.X.X"

  vpc_id = "vpc-id"
}