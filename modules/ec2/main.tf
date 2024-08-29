resource "aws_instance" "webserver1" {
  ami                    = var.ami_value
  instance_type          = var.instance_type_value
  vpc_security_group_ids = [var.security_group]
  subnet_id              = var.public_subnet1_id
  user_data              = filebase64("${path.module}/userdata.sh")
}


resource "aws_instance" "webserver2" {
  ami                    = var.ami_value
  instance_type          = var.instance_type_value
  vpc_security_group_ids = [var.security_group]
  subnet_id              = var.public_subnet2_id
  user_data              = filebase64("${path.module}/userdata.sh")
}