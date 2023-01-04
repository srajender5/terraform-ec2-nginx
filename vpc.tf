resource "aws_vpc" "nginx" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "rajender"
  }
}
resource "aws_subnet" "nginx-pub-1" {
  vpc_id                  = aws_vpc.nginx.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone1
  tags = {
    Name = "rajender-pub-1"
  }
}
resource "aws_subnet" "nginx-pub-2" {
  vpc_id                  = aws_vpc.nginx.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone2
  tags = {
    Name = "rajender-pub-2"
  }
}
resource "aws_subnet" "nginx-pub-3" {
  vpc_id                  = aws_vpc.nginx.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone3
  tags = {
    Name = "rajender-pub-3"
  }
}
resource "aws_subnet" "nginx-priv-1" {
  vpc_id                  = aws_vpc.nginx.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone1
  tags = {
    Name = "rajender-priv-1"
  }
}
resource "aws_subnet" "nginx-priv-2" {
  vpc_id                  = aws_vpc.nginx.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone2
  tags = {
    Name = "rajender-priv-2"
  }
}
resource "aws_subnet" "nginx-priv-3" {
  vpc_id                  = aws_vpc.nginx.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone3
  tags = {
    Name = "nginx-priv-3"
  }
}
resource "aws_internet_gateway" "nginx-IGW" {
  vpc_id = aws_vpc.nginx.id

  tags = {
    Name = "rajender-IGW"
  }
}
resource "aws_route_table" "nginx-pub-RT" {
  vpc_id = aws_vpc.nginx.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nginx-IGW.id
  }
  tags = {
    name = "rajender-pub-RT"
  }
}
resource "aws_route_table_association" "nginx-pub-1-a" {
  subnet_id      = aws_subnet.nginx-pub-1.id
  route_table_id = aws_route_table.nginx-pub-RT.id
}
resource "aws_route_table_association" "nginx-pub-2-a" {
  subnet_id      = aws_subnet.nginx-pub-2.id
  route_table_id = aws_route_table.nginx-pub-RT.id
}
resource "aws_route_table_association" "nginx-pub-3-a" {
  subnet_id      = aws_subnet.nginx-pub-3.id
  route_table_id = aws_route_table.nginx-pub-RT.id
}

