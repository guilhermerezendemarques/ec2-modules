output "ec2" {
    value = aws_instance.ec2_1
}

output "keypair-name" {
  value = module.keypair.key_name
  //sensitive = true
}