provider "aws" {
  region = "ap-south-1"
}

module "db" {
  source = "./dbserver-module"
  server_names=["mariadb","mysql","postgresql"]
}

output "pvt-ips" {
  value = [module.db.*.db-pvt-ips]
}