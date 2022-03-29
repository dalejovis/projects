locals {
  ambiente = {
    region       = var.region-aws
    VPCs         = "HML - Homologação"
    Azs          = "${data.aws_availability_zones.azs.names}"
    subnets-pub  = length(data.aws_availability_zones.azs.names)
    subnets-priv = length(data.aws_availability_zones.azs.names)
    #subnets-priv = var.cidr-subnet-priv-hml == "0.0.0.0/0" ? 0 : "${length(data.aws_availability_zones.azs.names)}"
  }
}

output "Ambiente" {
  value = local.ambiente
}

data "aws_availability_zones" "azs" {}