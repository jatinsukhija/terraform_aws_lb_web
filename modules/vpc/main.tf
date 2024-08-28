resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.test_vpc_tag
  }
}

resource "aws_subnet" "vpc_subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block1
  availability_zone       = var.subnet_az1
  map_public_ip_on_launch = true
}

resource "aws_subnet" "vpc_subnet2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block2
  availability_zone       = var.subnet_az2
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "vpc_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

resource "aws_route_table_association" "rta1" {
  route_table_id = aws_route_table.vpc_route_table.id
  subnet_id      = aws_subnet.vpc_subnet1.id
}

resource "aws_route_table_association" "rta2" {
  route_table_id = aws_route_table.vpc_route_table.id
  subnet_id      = aws_subnet.vpc_subnet2.id
}