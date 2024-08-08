provider "aws" {
    region = "ap-south-1"
}
//this tells terraform which plugin to use and which cloud provider we are creating resources for

resource "aws_vpc" "pranav-vpc" {
    cidr_block = "10.0.0.0/16"
}
//this will create this "aws_vpc" as a resource