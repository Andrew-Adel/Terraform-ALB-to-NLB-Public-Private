
output "vpc_id" {
  value = aws_vpc.my-vpc-tf.id
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.natGateway.id
  description = "The ID of the NAT gateway"
}

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.private_subnet: subnet.id]
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public_subnet: subnet.id]
}


# output "private_subnet_ids" {
#   value = aws_subnet.private_subnet[*].id
# }
output "subnet_map" {
  description = "Map of subnet names to subnet IDs"
  value = { 
    "private_subnet" = [for subnet in aws_subnet.private_subnet: subnet.id],
    "public_subnet"  = [for subnet in aws_subnet.public_subnet: subnet.id]
  }
}
