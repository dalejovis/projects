resource "aws_internet_gateway" "igw-joao" {
  vpc_id = aws_vpc.vpc-joao.id

  tags = {
    Name = "igw-joao-${var.env}"
  }
}