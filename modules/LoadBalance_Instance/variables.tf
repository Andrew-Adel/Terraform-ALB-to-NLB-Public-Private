variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "nlb_sg_data" {
  description = "A map of security group rules for the Load Balancer."
  type        = map(list(string))
}

variable "lb_data" {
  description = "A map of Load Balancer configurations."
  type        = map(list(string))
}

# variable "subnet_map" {
#   description = "A map of subnet IDs."
#   type        = map(string)
# }

variable "target_group" {
  description = "A map of target group configurations."
  type        = map(list(string))
}

variable "listener_data" {
  description = "A map of Load Balancer listener configurations."
  type        = map(list(string))
}

variable "ec2_private_instance_ids" {
  description = "A map of EC2 instance IDs for the target group attachments."
  type        = list(string)
}

variable "ec2_public_instance_ids" {
  description = "A map of public EC2 instance IDs for the public target group attachments."
  type        = list(string)
}

variable "subnet_map" {
  description = "Map of subnet names to subnet IDs"
  type        = map(list(string)) # The value is a map with subnet lists
}
