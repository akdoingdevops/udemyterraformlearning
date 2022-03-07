output "ip" {
  value = aws_instance.example.public_ip
}

output "pathtokey" {
  # value = ${path.module}"/"${var.PATH_TO_PUBLIC_KEY}
  value = "${path.module}/${var.PATH_TO_PUBLIC_KEY}"
}

output "keyname" {
  value = aws_key_pair.mykey.key_name
}

output "securitygroupid" {
  value = "security group id is ${aws_security_group.allow_tls.id}"
}