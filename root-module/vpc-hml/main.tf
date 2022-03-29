terraform {
  required_version = ">= 1.1.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.70.0"
    }
  }

  backend "s3" {
    bucket = "joao-remotestate"
    key    = "remote-states/vpc-hml/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-backend-joao"
  }

}

provider "aws" {
  region = var.region-aws
}

module "vpc-hml" {
  source     = "../modules"
  env        = "hml"
  region-aws = var.region-aws
  #VPC
  cidr-vpc = var.cidr-vpc-hml
  #EC2:
  image-pub          = var.image-pub
  instance-type-pub  = var.instance-type-pub
  image-priv         = var.image-priv
  instance-type-priv = var.instance-type-priv
  #RT
  cidr-rt-pub  = var.cidr-rt-pub
  cidr-rt-priv = var.cidr-rt-priv
  #SG
  from-port-egress-scg-joao = var.from-port-egress-scg-joao
  to-port-egress-scg-joao   = var.to-port-egress-scg-joao
  protocol-egress-scg-joao  = var.protocol-egress-scg-joao
  egress-cidr-scg-joao      = var.egress-cidr-scg-joao
  #Subnets
  cidr-subnet-pub  = var.cidr-subnet-pub-hml
  map-pub-ip       = var.map-pub-ip
  cidr-subnet-priv = var.cidr-subnet-priv-hml
}