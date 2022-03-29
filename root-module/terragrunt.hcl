remote_state {
  backend = "s3"
  config = {
    bucket         = "joao-remotestate"
    key            = "remote-states/vpc-hml/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-backend-joao"
  }
}