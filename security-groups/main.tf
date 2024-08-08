provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-025fe52e1f2dc5044"
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.Instance-Sec-Grps.name ]
}

resource "aws_security_group" "Instance-Sec-Grps" {
    name="allow HTTPS traffic"

    ingress {
        from_port=443
        to_port=443
        protocol="TCP"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress{
        from_port=443
        to_port=443
        protocol="TCP"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}