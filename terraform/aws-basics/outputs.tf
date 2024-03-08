output "ec2_private_ip" {
  value       = aws_instance.app.private_ip
  description = "value of the newly deployed EC2 instance"
}

output "nw_if_mac_id" {
  value       = aws_network_interface.ani.mac_address
  description = "physical address of the NIC for private IP."
}

output "ec2_public_ip" {
  value       = aws_instance.app.public_ip
  description = "to access the server over the Internet"
}

#If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use #public_ip as this field will change after the EIP is attached.

output "ec2_eip_public_ip" {
  value       = aws_eip.eip.public_ip
  description = "EIP public address"
}