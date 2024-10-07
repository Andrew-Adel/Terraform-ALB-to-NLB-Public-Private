resource "aws_security_group" "ec2_security_group" {
  name        = "ec2_security_group"
  description = "Security group for EC2 instances"
  vpc_id     = var.vpc_id  # Ensure this matches the VPC where instances are launched

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change as needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "ec2_security_group"
    created_by = "Andrew-Adel"
  }
}

resource "aws_security_group" "public_instance_sg" {
  name        = "public_instance_sg"
  description = "Allow SSH access to the public instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"] # Allow SSH from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks  = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}

resource "aws_security_group" "private_instance_sg" {
  name        = "private_instance_sg"
  description = "Allow SSH access from the public instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port                   = 22
    to_port                     = 22
    protocol                    = "tcp"
    security_groups             = [aws_security_group.public_instance_sg.id] # Allow SSH from the public instance
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks  = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}



resource "aws_instance" "public_instance" {
  count = length(var.public_subnet_ids)  # Use count based on the length of the list
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name              = var.key_pair_name  # Ensure this is set to the key pair you created
  subnet_id              = var.public_subnet_ids[count.index]  # Select the first public subnet
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.public_instance_sg.id]  # Reference the security group here
  
  depends_on = [aws_security_group.ec2_security_group]  # Ensure this instance waits for the security group to be created
  
  tags = {
    Name       = "Public EC2"
    created-by = "Andrew-Adel"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
    ]
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file(var.private_key_path)
    host     = self.public_ip
  }
}

resource "aws_instance" "private_instance" {
  count = length(var.private_subnet_ids)

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name              = var.key_pair_name  # Ensure this is set to the key pair you created
  subnet_id              = var.private_subnet_ids[count.index] # Select the first private subnet
  associate_public_ip_address = false
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]  # Reference the security group here
  
  depends_on = [aws_security_group.ec2_security_group]  # Ensure this instance waits for the security group to be created
  
  tags = {
    Name       = "Private EC2"
    created-by = "Andrew-Adel"
  }


  user_data = <<-EOF
              #!/bin/bash
              # Commands to run at startup
              yum update -y
              # Any other initialization commands can go here
              EOF

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt-get update",
  #     "sudo apt-get install -y nginx",
  #   ]
  # }

  # connection {
  #   type     = "ssh"
  #   user     = "ubuntu"
  #   private_key = file(var.private_key_path)
  #   host     = self.private_ip
  # }
}

