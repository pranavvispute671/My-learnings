variable "ingress" {
  type = list(number)
  default = [ 80, 443 ]
}

variable "egress" {
    type = list(number)
    default = [ 80, 443 ]
}

resource "aws_security_group" "sec-grps-module" {
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