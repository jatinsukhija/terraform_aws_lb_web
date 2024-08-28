provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"

}

module "ec2_instance" {
  source            = "./modules/EC2"
  public_subnet1_id = module.vpc.subnet1_id
  public_subnet2_id = module.vpc.subnet2_id
  security_group    = module.lb.security_group
}

module "load_balancer" {
  source              = "./modules/lb"
  custom_vpc_id       = module.vpc.custom_vpc_id
  public_subnet1_id   = module.vpc.subnet1_id
  public_subnet2_id   = module.vpc.subnet2_id
  webserver1_publicIP = module.ec2_instance.webserver1_publicIP
  webserver2_publicIP = module.ec2_instance.webserver2_publicIP
}

#module "s3" {
#  source = "./modules/s3"
#}