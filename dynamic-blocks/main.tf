provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "my-terraform-instance" {
    ami = "ami-025fe52e1f2dc5044"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.sec-grps.name]
    tags = {
        Name = "My TerraForm Instance"
    }
}

variable "ingress-rules" {
    type    = list(number)
    default = [80, 443]
}

variable "egress-rules" {
    type    = list(number)
    default = [80, 443, 25, 3306, 53, 8080]
}

resource "aws_security_group" "sec-grps" {
    name = "Allow HTTPS traffic"

    dynamic "ingress" {
        for_each = var.ingress-rules
        content {
            from_port   = ingress.value
            to_port     = ingress.value
            protocol    = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        for_each = var.egress-rules
        content {
            from_port   = egress.value
            to_port     = egress.value
            protocol    = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}
