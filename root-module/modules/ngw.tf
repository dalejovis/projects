resource "aws_nat_gateway" "ngw-joao" {
  #count         = var.cidr-subnet-priv == "0.0.0.0/0" ? 0 : 1
  allocation_id = aws_eip.eip-ngw-joao.id
  subnet_id     = aws_subnet.subnet-pub-joao[0].id

  tags = {
    Name = "ngw-joao-${var.env}"
  }
  depends_on = [aws_internet_gateway.igw-joao]
}