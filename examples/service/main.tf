module "account_context" {
  source = "project-init/account-context/aws"
  # Project Init recommends pinning every module to a specific version
  # version = "vX.X.X"

  # Put in an empty value (of the correct type) to have the context populated from the existing parameters.
  vpc_id            = ""
  public_subnet_ids = []

  # Anything not listed will be taken as null and not populated.
}