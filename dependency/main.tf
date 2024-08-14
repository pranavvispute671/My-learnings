provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "db" {
  ami = "ami-0d473344347276854"
  instance_type = "t2.micro"
}

resource "aws_instance" "wb" {
  ami = "ami-0d473344347276854"
  instance_type = "t2.micro"

  depends_on = [ aws_instance.db ] // depends_on signifies that current resource will be created after the mentioned one
}