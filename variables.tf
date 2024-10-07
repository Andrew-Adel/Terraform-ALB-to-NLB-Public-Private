variable "my-vpc-cidr" {
  description = "this vpc cidr range for my vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "my-subnet-cidr" {
  description = "this subnet of vpc cidr range for my vpc"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "my-subnet-availability_zone" {
  description = "this list of availability zones for me"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnet-data" {
  # description = "this list of availability zones for me"
  type = map(list(string))

  # default = [ "us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "private_subnet-data" {
  # description = "this list of availability zones for me"
  type = map(list(string))

  # default = [ "us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"  # Example default value, adjust as necessary
}

variable "private_key_path" {
  description = "Path to the private key for SSH access"
  type        = string
}

variable "key_pair_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

///////////////////////////////////////////////

variable "lb_data" {
description = "lb data"
type = map(list(string))
}
variable "nlb_sg_data" {
    description = "lb-sg"
    type = map(list(string))
}
variable "target_group" {
    description = "target_group"
    type = map(list(string))
}
variable "listener_data" {
    description = "listner data"
    type = map(list(string))
}