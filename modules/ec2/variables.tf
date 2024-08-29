
variable "ami_value" {
  description = "value for the ami"
  default     = "ami-0c7217cdde317cfec"
}

variable "instance_type_value" {
  description = "value for instance_type"
  default     = "t2.micro"
}
variable "public_subnet1_id"{}
variable "public_subnet2_id" {}

variable "security_group" {}