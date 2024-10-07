# # variables.tf inside modules/ec2_instance/

# variable "public_instance_count" {
#   description = "Number of public EC2 instances"
#   type        = number
#   default     = 2
# }

# variable "private_instance_count" {
#   description = "Number of private EC2 instances"
#   type        = number
#   default     = 2
# }

# variable "ami_id" {
#   description = "AMI ID to use for the EC2 instances"
#   type        = string
# }

# variable "instance_type" {
#   description = "EC2 instance type"
#   type        = string
#   default     = "t2.micro"
# }

# variable "public_subnet_ids" {
#   description = "List of public subnet IDs"
#   type        = list(string)
# }

# variable "private_subnet_ids" {
#   description = "List of private subnet IDs"
#   type        = list(string)
# }

# variable "key_name" {
#   description = "SSH key name to access the EC2 instances"
#   type        = string
# }

# variable "private_key_path" {
#   description = "Path to the private key file for SSH access"
#   type        = string
# }

# variable "output_file_path" {
#   description = "File path where the IP addresses will be written"
#   type        = string
#   default     = "all-ips.txt"
# }

# variable "vpc_id" {
#   description = "VPC ID to associate the security groups"
#   type        = string
# }

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "private_key_path" {
  description = "Path to the private key for SSH access"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "key_pair_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}
