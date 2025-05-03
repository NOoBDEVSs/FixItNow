terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.96.0"
    }
  }
}

provider "aws" {
  region = var.region
  access_key = "key-goes-here"
  secret_key = "secret-goes-here"
}

module "vpc" {
  source           = "./modules/hasetup"
  vpc_cidr         = var.vpc_cidr
  name             = var.name
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  data_subnets     = var.data_subnets
  azs              = var.azs
  ami_id           = var.ami_id
  key_name         = var.key_name
  instance_type    = var.instance_type
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  acm_certificate_arn  = var.acm_certificate_arn
}