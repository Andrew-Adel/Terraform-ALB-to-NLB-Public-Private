module "Main-VPC" {
  source = "./modules/My_VPC_Instance"
  
  public_subnet-data = var.public_subnet-data
  private_subnet-data = var.private_subnet-data
  my-subnet-availability_zone = var.my-subnet-availability_zone
  my-subnet-cidr = var.my-subnet-cidr
  my-vpc-cidr = var.my-vpc-cidr
  
}

# module "EC2-Instances" {
#   source                = "./modules/EC2_instance"
#   public_instance_count = 2
#   private_instance_count = 2
#   ami_id                = "ami-0866a3c8686eaeeba"  # Use your AMI ID
#   instance_type         = "t2.micro"
#   public_subnet_ids = [module.Main-VPC.public_subnet_ids[0], module.Main-VPC.public_subnet_ids[1]]
#   private_subnet_ids    = [module.Main-VPC.private_subnet_ids[0], module.Main-VPC.private_subnet_ids[1]]
#   key_name              = var.key_name
#   private_key_path      = var.private_key_path
#   output_file_path      = "all-ips.txt"
#   vpc_id                = module.Main-VPC.vpc_id
# }

module "My_EC2_Instance" {
  source = "./modules/EC2_Instance"  # Path to your EC2 module

  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_pair_name        = var.key_pair_name
  public_subnet_ids    = module.Main-VPC.public_subnet_ids
  private_subnet_ids   = module.Main-VPC.private_subnet_ids
  private_key_path     = var.private_key_path
  vpc_id               = module.Main-VPC.vpc_id  # Pass the VPC ID to the EC2 module
}

module "load_balancer" {
  source = "./modules/LoadBalance_Instance"
  vpc_id = module.Main-VPC.vpc_id
  subnet_map  = module.Main-VPC.subnet_map
  ec2_private_instance_ids = module.My_EC2_Instance.ec2_private_instance_ids
  ec2_public_instance_ids=module.My_EC2_Instance.ec2_public_instance_ids
  lb_data= var.lb_data
  nlb_sg_data=var.nlb_sg_data
  target_group= var.target_group
  listener_data=var.listener_data

}
