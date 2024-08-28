variable "vpc_cidr_block" {
  description = "AWS VPC cidr block ip"
  default     = "10.0.0.0/16"
}

variable "test_vpc_tag" {
  description = "AWS VPC tag name"
  default     = "test-VPC"
}
variable "subnet_cidr_block1" {
  description = "AWS subnet cidr block ip"
  default     = "10.0.0.0/24"
}

variable "subnet_az1" {
  description = "AWS subnet az"
  default     = "us-east-1a"
}

variable "subnet_cidr_block2" {
  description = "AWS subnet cidr block ip"
  default     = "10.0.1.0/24"
}

variable "subnet_az2" {
  description = "AWS subnet az"
  default     = "us-east-1b"
}

variable "rt_cidr_block" {
  description = "AWS route cidr block"
  default     = "0.0.0.0/0"
}