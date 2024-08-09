provider "aws" {
    region = "ap-south-1"
}

module "dbserver" {                            //creates dbserver from template
  source = "./dbserver-module"             
  ec2-name = "DB-Server"
}

output "module-db-name" {                      //dbserver private id var
  value = module.dbserver.db-pvt-id
}

module "wbserver" {
  source = "./wbserver-module"
  ec2-name = "WB-Server"
  script-file = "server-script.sh"
}
output "module-wb-server" {
  value = module.wbserver.wbserver-publicip
}