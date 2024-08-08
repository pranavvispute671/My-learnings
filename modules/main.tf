provider "aws" {
    region = "ap-south-1"
}

module "ec2-module" {
  source = "./ec2-module"
  ec-2-Name="My-instance-by-module"
}

output "module-ec2-id" {
  value = module.ec2-module.my-instance-id
}