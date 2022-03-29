resource "aws_subnet" "subnet-pub-joao" {
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  count                   = length(data.aws_availability_zones.azs.names)
  vpc_id                  = aws_vpc.vpc-joao.id
  cidr_block              = element(var.cidr-subnet-pub, count.index)
  map_public_ip_on_launch = var.map-pub-ip

  tags = {
    Name = "subnet-pub-${var.env}-joao-${count.index + 1}"
  }
}

resource "aws_route_table_association" "pub" {
  count          = length(data.aws_availability_zones.azs.names)
  subnet_id      = aws_subnet.subnet-pub-joao[count.index].id
  route_table_id = aws_route_table.rt-pub-joao.id
}

resource "aws_subnet" "subnet-priv-joao" {
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
  #count            = var.cidr-subnet-priv == "0.0.0.0/0" ? 0 : length(data.aws_availability_zones.azs.names)
  count             = length(data.aws_availability_zones.azs.names)
  vpc_id            = aws_vpc.vpc-joao.id
  cidr_block        = element(var.cidr-subnet-priv, count.index)

  tags = {
    Name = "subnet-priv-${var.env}-joao-${count.index + 1}"
  }
}

resource "aws_route_table_association" "priv1" {
  #count         = var.cidr-subnet-priv == "0.0.0.0/0" ? 0 : length(data.aws_availability_zones.azs.names)
  count          = length(data.aws_availability_zones.azs.names)
  subnet_id      = aws_subnet.subnet-priv-joao[count.index].id
  route_table_id = aws_route_table.rt-priv-joao.id
}
