variable "ec-2-Name" {
    type = string
    default = "My-instance-module"
}

resource "aws_instance" "ec-instance" {
    ami= "ami-025fe52e1f2dc5044"
    instance_type = "t2.micro"

    tags ={
        Name=var.ec-2-Name
    }
}