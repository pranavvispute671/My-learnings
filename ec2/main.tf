provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2_instance" {
    ami="ami-025fe52e1f2dc5044"
    instance_type = "t2.micro"
    tags={
        Name="My_terra_instance"              //creates the EC2 instance
    }
}

resource "aws_eip" "elatic-ip" {
    instance = aws_instance.ec2_instance.id   //attached the elastic ip to the instance
}

output "EC2" {
    value = aws_instance.ec2_instance.id    //prints the instance name
}

output "EIP" {
    value = aws_eip.elatic-ip.public_ip      //prints the Elatic Ip address
}
