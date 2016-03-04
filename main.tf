module "global_admins" {
  source = "modules/global/admins"

  aws_profile = "${var.aws_profile}"
  aws_region = "us-east-1"

  account_name = "${var.account_name}"
  nubis_version = "${var.nubis_version}"
}

module "vpcs" {
  source = "modules/global/vpcs"

  aws_regions = "${var.aws_regions}"
  aws_profile = "${var.aws_profile}"

  # This exists to force a dependency on the global admins module
  account_name = "${module.global_admins.account_name}"
  
  nubis_version = "${var.nubis_version}"
  environments = "${var.environments}"
  environments_networks = "${var.environments_networks}"
  environments_ipsec_targets = "${var.environments_ipsec_targets}"
}