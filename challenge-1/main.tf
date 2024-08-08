provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "TerraFormVPC" {
    cidr_block = "192.168.0.0/24"
    tags = {
      Name="TerraFormVPC"
    }
}