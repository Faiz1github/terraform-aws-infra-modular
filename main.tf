module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs
  name           = "demo"
}

module "sg" {
  source  = "./modules/sg"
  name    = "demo"
  vpc_id  = module.vpc.vpc_id
}

module "ec2" {
  source    = "./modules/ec2"
  name      = "demo"
  ami       = var.ami
  subnet_id = module.vpc.public_subnet_ids[0]
  sg_id     = module.sg.sg_id
  key_name  = var.key_name
}

