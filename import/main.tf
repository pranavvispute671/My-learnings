provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "my_vpc_1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="MyogVPC"
  }
}

resource "aws_vpc" "my_vpc_2" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name="MyAWSVPC"
  }
}