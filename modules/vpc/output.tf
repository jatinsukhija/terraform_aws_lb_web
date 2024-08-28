#####################   VPC Outputs    #######################

output "custom_vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "custom_vpc_name" {
  value = aws_vpc.my_vpc.tags.Name
}

output "custom_vpc_cidr" {
  value = aws_vpc.my_vpc.cidr_block
}


#####################   Subnet Outputs    #######################

output "public_subnet1_id" {
  value = aws_subnet.vpc_subnet1.id
}

output "public_subnet2_id" {
  value = aws_subnet.vpc_subnet2.id
}