provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "db-server" {
  ami="ami-025fe52e1f2dc5044"
  instance_type = "t2.micro"
  tags = {
    Name="DB Server"
  }
}

resource "aws_instance" "db-server-2" {
  ami="ami-025fe52e1f2dc5044"
  instance_type = "t2.micro"
  tags={
    Name="DB Server"
  }
  depends_on = [ aws_instance.db-server ]
}

# data "aws_instance" "dbSearch" {
#   filter {
#     name = "tag:Name"
#     values = ["DB Server"]
#   }
# }

# output "dbservers" {
#   value = data.aws_instance.dbSearch.availability_zone
# }