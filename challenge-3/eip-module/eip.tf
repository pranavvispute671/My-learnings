variable "wbserver-name" {
  type = string
}

resource "aws_eip" "webserver-eip" {
  instance = var.wbserver-name
}

output "webserver-public-ip" {
  value = aws_eip.webserver-eip.public_ip
}