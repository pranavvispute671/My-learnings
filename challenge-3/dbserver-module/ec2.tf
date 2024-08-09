variable "ec2-name" {                                 //ec2 instance name variable
  type = string
}

resource "aws_instance" "dbservermodule" {            //creates template for dbserver instance
    ami = "ami-025fe52e1f2dc5044"
    instance_type = "t2.micro"
    tags = {
      Name=var.ec2-name
    }
}

output "db-pvt-id" {                                   //private id output variable
  value = aws_instance.dbservermodule.private_ip
}