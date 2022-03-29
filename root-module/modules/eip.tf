resource "aws_eip" "eip-ngw-joao" {
  #count      = var.cidr-subnet-priv == "0.0.0.0/0" ? 0 : 1
  vpc        = true
  depends_on = [aws_internet_gateway.igw-joao]
  tags = {
    Name = "EIP NAT Gateway - ${var.env}"
  }
}