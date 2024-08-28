output "webserver1_publicIP" {
  value = aws_instance.webserver1.public_ip
}

output "webserver2_publicIP" {
  value = aws_instance.webserver2.public_ip
}