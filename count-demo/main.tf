provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-0d473344347276854"
  instance_type = "t2.micro"
  count = 3  //will create 3 resources
}