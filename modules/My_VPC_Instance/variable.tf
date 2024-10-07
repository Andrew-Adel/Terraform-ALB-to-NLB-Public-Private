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