variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db" {            //creates template for dbserver instance
    ami = "ami-025fe52e1f2dc5044"
    instance_type = "t2.micro"
    count = length(var.server_names)
    tags = {
      Name=var.server_names[count.index]
    }
}

output "db-pvt-ips" {                                   //private id output variable
  value = [aws_instance.db.*.private_ip]
}