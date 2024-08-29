variable "mysg_name" {
  default = "web-sg"
}

variable "mysgingress_cidr_block" {
  description = "security group ingress cidr block"
  default     = "0.0.0.0/0"
}

variable "mysergress_cidr_block" {
  description = "security group egress cidr block"
  default     = "0.0.0.0/0"
}

variable "aws_security_group" {
  description = "security group"
  default     = "security group"
}

variable "myalb-name" {
  default = "myalb"
}

variable "my-alb-target-group" {
  default = "myalb-TG"
} 
variable "custom_vpc_id" {}

variable "public_subnet1_id" {}
variable "public_subnet2_id" {}

variable "webserver1_publicIP" {}
variable "webserver2_publicIP" {}