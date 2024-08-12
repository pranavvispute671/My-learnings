variable "ec2-name" {
  type = string
}

variable "script-file" {
  type = string
}

resource "aws_instance" "wbservermodule" {
    ami = "ami-025fe52e1f2dc5044"
    instance_type = "t2.micro"
    user_data = file(var.script-file)
    security_groups = [aws_security_group.sec-grps.name]
    tags = {
      Name=var.ec2-name
    }
}

module "wbserver-eip-import" {
  source = "../eip-module"
  wbserver-name = aws_instance.wbservermodule.id
}

output "wbserver-publicip" {
  value = aws_instance.wbservermodule.public_ip
}

variable "ingress" {
  type = list(number)
  default = [ 80, 443 ]
}

variable "egress" {
    type = list(number)
    default = [ 80, 443 ]
}

resource "aws_security_group" "sec-grps" {
    name="allow HTTPS"
    dynamic "ingress" {
        for_each = var.ingress
        content {
          from_port = ingress.value
          to_port = ingress.value
          protocol = "TCP"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress" {
        for_each = var.egress
        content {
          from_port = egress.value
          to_port = egress.value
          protocol = "TCP"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }
}