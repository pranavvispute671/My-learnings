provider "aws" {
  region = "ap-south-1"
}

resource "aws_db_instance" "myRDS" {
  db_name = "pranavfirstrds"  //this is a unique name of db
  identifier = "pranavsdatabase"   //this is the name of database
  instance_class = "db.t3.micro"
  engine = "mariadb"
  engine_version = "10.11.8"
  username = "root"
  password = "rootroot"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}