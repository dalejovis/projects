resource "aws_instance" "maq-pub-joao" {
  count                  = length(data.aws_availability_zones.azs.names)
  ami                    = var.image-pub
  instance_type          = var.instance-type-pub
  subnet_id              = aws_subnet.subnet-pub-joao[count.index].id
  iam_instance_profile   = aws_iam_instance_profile.role-joao.name
  vpc_security_group_ids = [aws_security_group.scg-joao.id]

  tags = {
    Name = "maq-pub-${var.env}-joao-${count.index + 1}"
  }
}

resource "aws_instance" "maq-priv-joao" {
  #count                  = var.cidr-subnet-priv == "0.0.0.0/0" ? 0 : length(data.aws_availability_zones.azs.names)
  count                  = length(data.aws_availability_zones.azs.names)
  ami                    = var.image-priv
  instance_type          = var.instance-type-priv
  subnet_id              = aws_subnet.subnet-priv-joao[count.index].id
  iam_instance_profile   = aws_iam_instance_profile.role-joao.name
  vpc_security_group_ids = [aws_security_group.scg-joao.id]
  depends_on = [
    aws_nat_gateway.ngw-joao
  ]

  tags = {
    Name = "maq-priv-${var.env}-joao-${count.index + 1}"
  }
}