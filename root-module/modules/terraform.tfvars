region-aws = "us-east-2"

cidr-vpc = "10.0.0.0/16"

cidr-subnet-pub = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24",
  "10.0.4.0/24",
  "10.0.5.0/24",
  "10.0.6.0/24",
]

cidr-subnet-priv = [
  "10.0.11.0/24",
  "10.0.12.0/24",
  "10.0.13.0/24",
  "10.0.14.0/24",
  "10.0.15.0/24",
  "10.0.16.0/24"
]

map-pub-ip = true

cidr-rt-pub = "0.0.0.0/0"

cidr-rt-priv = "0.0.0.0/0"

image-pub = "ami-002068ed284fb165b"

image-priv = "ami-002068ed284fb165b"

instance-type-pub = "t2.micro"

instance-type-priv = "t2.micro"

#Security Group:
from-port-egress-scg-joao = 0
to-port-egress-scg-joao   = 0
egress-cidr-scg-joao      = ["0.0.0.0/0", ]
protocol-egress-scg-joao  = "-1"