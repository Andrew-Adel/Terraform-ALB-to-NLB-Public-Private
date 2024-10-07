public_subnet-data = {
  "public_subnet-1" = ["10.0.1.0/24", "us-east-1a"],
  "public_subnet-2" = ["10.0.2.0/24", "us-east-1b"]
}

private_subnet-data = {
  "private_subnet-1" = ["10.0.3.0/24", "us-east-1a"],
  "private_subnet-2" = ["10.0.4.0/24", "us-east-1b"]
}

private_key_path = "./aws-config/2-Teir-App.pem"

# EC2 instance type
instance_type = "t2.micro"  # Adjust as necessary based on your needs

# AMI ID for the EC2 instances
ami_id = "ami-0866a3c8686eaeeba"  # Replace with your desired AMI ID

key_pair_name = "2-Teir-App"         # Replace with your key pair name



lb_data= {
  "my-internal-load-balancer" = [true,"network","nlb-security-group","private_subnet",false],
  "my-public-load-balancer"   = [false, "application", "public-lb-sg", "public_subnet", true]}
nlb_sg_data=  {
  "nlb-security-group"= [0,"tcp","0.0.0.0/0",80,-1],
  "public-lb-sg"       = [0, "tcp", "0.0.0.0/0", 80, -1]
}

target_group = {
  "internal-target-group" =[80,"TCP","traffic-port"],
  "public-target-group"   = [80, "HTTP", "traffic-port"]
}
listener_data= {
  "my-internal-load-balancer"=[80,"TCP", "forward","internal-target-group"],
  "my-public-load-balancer"   = [80, "HTTP", "forward", "public-target-group"]
}
