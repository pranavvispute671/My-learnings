provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "dbinstance" {    //assignment 1
    ami = "ami-025fe52e1f2dc5044"
    instance_type = "t2.micro"

    tags={
        Name="DB Server instance"
    }
}

resource "aws_instance" "webinstance" {      //assignment 2
    ami = "ami-025fe52e1f2dc5044"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web-sec-grps.name]
    user_data = file("server-script.sh")
    tags={
        Name="Web Server Instance"
    }
}

output "pvtIP" {
    value = aws_instance.webinstance.id
}
resource "aws_eip" "db-elasticip" {
    instance = aws_instance.webinstance.id
}

variable "ingress" {
  type = list(number)
  default = [ 80, 443 ]
}

variable "egress" {
  type = list(number)
  default = [ 80, 443 ]
}

resource "aws_security_group" "web-sec-grps" {
    name = "webserver-Security-groups"

    dynamic "ingress" {
        for_each = var.ingress
        content {
            from_port   = ingress.value
            to_port     = ingress.value
            protocol    = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        for_each = var.egress
        content {
            from_port   = egress.value
            to_port     = egress.value
            protocol    = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

}