module "vpc" {
  source = "./vpc_module"
  vpc_cidr_block = var.vpc_cidr_block
}