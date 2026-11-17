locals {
  instance_type = var.instance_types[var.environment]
  vol_size      = var.environment == "dev" ? 8 : var.environment == "staging" ? 15 : 30

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
  }

  # dev: false | staging, prod: true
  enable_monitoring = var.environment == "dev" ? false : true
  # dev: true  | staging, prod: false
  assign_public_ip = var.environment == "dev" ? true : false
}
