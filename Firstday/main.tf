provider "aws" {
    region = "us-east-1"
  }
resource "aws_instance" "firsttreeaform" {
    ami = "ami-0bb4c991fa89d4b9b"
    instance_type = "t2.micro"
    count = "3"  
}
tags = {
    "Name" = "MyInstanceName"  # Replace with the desired name for your instance
    "Environment" = "Production"  # You can add additional tags as needed
  }