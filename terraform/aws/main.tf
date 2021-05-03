terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-01c403aed6380bb35"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstanceViaTerraform"
  }
}
