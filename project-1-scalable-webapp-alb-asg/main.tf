provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 5.0.0, < 6.0.0"

  name = "web-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_flow_log = false
}



module "iam" {
  source = "./modules/iam"
}

module "rds" {
  source          = "./modules/rds"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  db_password     = var.db_password
  web_sg_id       = module.ec2.sg_id
}

module "ec2" {
  source              = "./modules/ec2"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_id           = module.vpc.private_subnets[0]
  vpc_id              = module.vpc.vpc_id
  rds_endpoint        = module.rds.rds_endpoint
  iam_instance_profile = module.iam.instance_profile
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "asg" {
  source          = "./modules/asg"
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  sg_id           = module.ec2.sg_id
  iam_profile     = module.iam.instance_profile
  rds_endpoint    = module.rds.rds_endpoint
  private_subnets = module.vpc.private_subnets
  tg_arn          = module.alb.tg_arn
}

module "cloudwatch" {
  source   = "./modules/cloudwatch"
  asg_name = module.asg.asg_name
  sns_arn  = aws_sns_topic.alerts.arn
}

resource "aws_sns_topic" "alerts" {
  name = "web-alerts"
}