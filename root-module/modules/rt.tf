resource "aws_route_table" "rt-pub-joao" {
  vpc_id = aws_vpc.vpc-joao.id

  route {
    cidr_block = var.cidr-rt-pub
    gateway_id = aws_internet_gateway.igw-joao.id
  }

  tags = {
    Name = "rt-pub-${var.env}-joao"
  }
}

resource "aws_route_table" "rt-priv-joao" {
  vpc_id = aws_vpc.vpc-joao.id
  #count  = var.cidr-subnet-priv == "0.0.0.0/0" ? 0 : 1

  route {
    cidr_block = var.cidr-rt-priv
    gateway_id = aws_nat_gateway.ngw-joao.id
  }

  tags = {
    Name = "rt-priv-${var.env}-joao"
  }
}