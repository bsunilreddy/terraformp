provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired VPC CIDR block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "public_subnet" {
  count = 2
  vpc_id = aws_vpc.example.id
  cidr_block = "10.0.${count.index}.0/24"
  availability_zone = "us-east-1a" # Replace with your desired availability zone
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = 2
  vpc_id = aws_vpc.example.id
  cidr_block = "10.0.${count.index + 2}.0/24"
  availability_zone = "us-east-1a" # Replace with your desired availability zone

  tags = {
    Name = "PrivateSubnet-${count.index + 1}"
  }
}
