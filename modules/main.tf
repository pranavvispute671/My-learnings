provider "aws" {
    region = "ap-south-1"
}

module "ec2-module" {
  source = "./ec2"
  ec-2-Name="My-instance-by-module"
}