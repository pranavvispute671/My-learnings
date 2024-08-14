provider "aws" {
      region = "ap-south-1"
}   

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
}