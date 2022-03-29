variable "region-aws" {
  type        = string
  default     = "us-east-2"
  description = "Define a região da AWS."

  validation {
    condition     = contains(["us-east-1", "us-east-2", "sa-east-1"], lower(var.region-aws))
    error_message = "Apenas as seguintes regiões são aceitas: 'us-east-1', 'us-east-2', 'sa-east-1'."
  }
}

variable "env" {
  type        = string
  default     = ""
  description = "Define o nome do ambiente."
}

variable "cidr-vpc" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Define o CIDR da VPC"
}

variable "cidr-subnet-pub" {
  type        = list(string)
  default     = ["10.0.0.0/24"]
  description = "Define o CIDR da Subnet Pública"
}

variable "cidr-subnet-priv" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "Define o CIDR da Subnet Privada"
}

variable "map-pub-ip" {
  type        = bool
  default     = true
  description = "Define um IP público para as instâncias criadas naquela subnet."
}

variable "cidr-rt-pub" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Define o CIDR da Route Table Pública"
}

variable "cidr-rt-priv" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Define o CIDR da Route Table Privada"
}

variable "image-pub" {
  type        = string
  default     = "ami-002068ed284fb165b"
  description = "Define a Imagem das instâncias públicas."
}

variable "image-priv" {
  type        = string
  default     = "ami-002068ed284fb165b"
  description = "Define a Imagem das instâncias privadas."
}

variable "instance-type-pub" {
  type        = string
  default     = "t2.micro"
  description = "Define o tipo de instância pública que será criada."
}

variable "instance-type-priv" {
  type        = string
  default     = "t2.micro"
  description = "Define o tipo de instância privada que será criada."
}

variable "from-port-egress-scg-joao" {
  type        = number
  default     = 0
  description = "Porta de saída do egress do security group scg-joao."
}

variable "to-port-egress-scg-joao" {
  type        = number
  default     = 0
  description = "Porta de entrada do egress do security group scg-joao."
}

variable "protocol-egress-scg-joao" {
  type        = string
  default     = "-1"
  description = "Protocolo do egress do security group scg-joao."
}
variable "egress-cidr-scg-joao" {
  type        = list(string)
  default     = ["0.0.0.0/0", ]
  description = "CIDR do egress do security group scg-joao."
}


#terraform console e depois local.region