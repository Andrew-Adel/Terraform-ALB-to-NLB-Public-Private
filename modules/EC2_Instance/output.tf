output "ec2_private_instance_ids" {
  value = [for instance in aws_instance.private_instance : instance.id]
}
output "ec2_public_instance_ids" {
  value = [for instance in aws_instance.public_instance : instance.id]
}