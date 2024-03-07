terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.38.0"
    }
  }

  cloud {
    organization = "devops-Projects-99"

    workspaces {
      name = "Workspace-1"
    }
  }
}


## VPC

resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tr-vpc"
  }
}

## Subnet
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "tr-Subnet"
  }
}

####

# resource "aws_network_interface" "foo" {
#   subnet_id   = aws_subnet.subnet1.id
#   #private_ips = ["172.16.10.100"]

#   tags = {
#     Name = "primary_network_interface"
#   }
# }

## AWS instance
/*
resource "aws_instance" "foo" {
  ami           = "ami-05fb0b8c1424f266b" # us-west-2
  instance_type = var.instance
  subnet_id = aws_subnet.subnet1.id
  associate_public_ip_address = true
  tags = {
    Name = "tr-ec2"
  }

}
*/