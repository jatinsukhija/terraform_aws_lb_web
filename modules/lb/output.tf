output "security_group" {
  value = aws_security_group.websg.id
}

output "loadbalancerdns" {
  value = aws_lb.myalb.dns_name
}