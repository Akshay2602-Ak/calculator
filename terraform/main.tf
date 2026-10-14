
module "vpc" {
  source = "./modules/vpc"

  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

module "sgr" {
  source = "./modules/sgr"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
  admin_ip     = var.admin_ip
}

module "ec2" {
  source = "./modules/ec2"

  project_name      = var.project_name
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.sgr.security_group_id
  instance_type     = var.instance_type

  public_key_path = var.public_key_path
}
