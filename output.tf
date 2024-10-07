# output "my-vpc-arn" {
#   value = module.Main-VPC.my-vpc-tf.arn
# }

# resource "local_file" "vpc-arn" {
#   content  = module.Main-VPC.my-vpc-tf.arn
#   filename = "vpc-output.txt"
# }