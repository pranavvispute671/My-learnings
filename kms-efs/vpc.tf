resource "aws_vpc" "my-efs-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name="My EFS VPC"
  }
}

resource "aws_subnet" "efs-subnet" {
  vpc_id = aws_vpc.my-efs-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name="My EFS Subnet"
  }
}

resource "aws_internet_gateway" "efs-internet-gateway" {
  vpc_id = aws_vpc.my-efs-vpc.id
  tags = {
    Name="My EFS Gateway"
  }
}

resource "aws_route_table" "efs-route-table" {
  vpc_id = aws_vpc.my-efs-vpc.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.efs-internet-gateway.id
  }

  tags={
    Nmae="My EFS Route Table"
  }
}

resource "aws_route_table_association" "efs-route-assosc" {
  subnet_id = aws_subnet.efs-subnet.id
  route_table_id = aws_route_table.efs-route-table.id
}