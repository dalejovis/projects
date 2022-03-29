resource "aws_security_group" "scg-joao" {
  name        = "scg-${var.env}-joao"
  description = "security group de joao - ${var.env}"
  vpc_id      = aws_vpc.vpc-joao.id

  /*
  ingress {
    description = "alguma coisa"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc-joao.cidr_block]
  }
*/

  egress {
    from_port   = var.from-port-egress-scg-joao
    to_port     = var.to-port-egress-scg-joao
    protocol    = var.protocol-egress-scg-joao
    cidr_blocks = var.egress-cidr-scg-joao
  }

  tags = {
    Name = "scg-${var.env}-joao"
  }
}