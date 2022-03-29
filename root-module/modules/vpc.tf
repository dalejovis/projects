resource "aws_vpc" "vpc-joao" {
  cidr_block       = var.cidr-vpc
  instance_tenancy = "default"

  tags = {
    Name = "vpc-${var.env}-joao"
  }
}