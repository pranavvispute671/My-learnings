provider "aws" {
  region = "ap-south-1"
}

variable "server_count" {
  type = number
}

resource "aws_instance" "dbserver" {
  ami="ami-0d473344347276854"
  instance_type = "t2.micro"
  count = var.server_count
}