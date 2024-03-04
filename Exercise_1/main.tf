terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 0.12"
}

# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
  region = var.region
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_key_pair" "ec2-t2-keypair" {
  key_name   = "ec2-t2-keypair"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "udacity_t2" {
  count                  = 4
  ami                    = "ami-0c2b8ca1dad447f8a" # Ubuntu 20.04 LTS
  instance_type          = "t2.micro"
  key_name               = "ec2-t2-keypair"
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.vpc_subnet_id
  tags = {
    Name = "Udacity T2 ${count.index + 1}"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_key_pair" "ec2-m4-keypair" {
  key_name   = "ec2-m4-keypair"
  public_key = file("~/.ssh/id_ed25519.pub")
}

# resource "aws_instance" "udacity_m4" {
#   count                  = 2
#   ami                    = "ami-0c2b8ca1dad447f8a" # Ubuntu 20.04 LTS
#   instance_type          = "m4.large"
#   key_name               = aws_key_pair.ec2-m4-keypair.key_name
#   vpc_security_group_ids = var.vpc_security_group_ids
#   subnet_id              = var.vpc_subnet_id
#   tags = {
#     Name = "Udacity M4 ${count.index + 1}"
#   }
# }