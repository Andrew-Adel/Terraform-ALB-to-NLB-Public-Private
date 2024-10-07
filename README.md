# Terraform-ALB-to-NLB-Public-Private
This project implements a public-private architecture on AWS using Terraform. It uses an Application Load Balancer (ALB) for public-facing traffic, which redirects requests to a public EC2S which redirect requests to a Network Load Balancer (NLB) for private resources, such as EC2 instances hosted in a Virtual Private Cloud (VPC). The infrastructure is designed to be highly available and scalable.

## Project Structure

```plaintext
.
├── .gitignore                   # Git ignore file to exclude unnecessary files from version control
├── .terraform.lock.hcl          # Terraform lock file for module versioning
├── backend.tf                   # Terraform backend configuration (e.g., remote state storage)
├── dev.tfvars                   # Development-specific variable values
├── main.tf                      # Main entry point for the infrastructure definition
├── output.tf                    # Defines the output variables from the deployment
├── provider.tf                  # Provider configuration (e.g., AWS settings)
├── variables.tf                 # Global variables for the infrastructure (e.g., region, instance type)
├── values.auto.tfvars           # Automatically loaded variable values
├── EC2_Instance/                # EC2 instance resources module
│   ├── main.tf                  # EC2 instance definitions
│   ├── outputs.tf               # Outputs specific to EC2 instances (e.g., instance IDs)
│   └── variables.tf             # Variables specific to EC2 instances (e.g., AMI ID, instance type)
├── LoadBalance_Instance/         # Load balancer resources module
│   ├── main.tf                  # Load balancer instance definitions
│   ├── outputs.tf               # Outputs specific to load balancer instances (e.g., DNS name)
│   └── variables.tf             # Variables specific to load balancer instances (e.g., load balancer type)
├── My_VPC_Instance/              # VPC resources module
│   ├── elasticIP.tf             # Elastic IP definitions
│   ├── igw.tf                   # Internet Gateway definitions
│   ├── natGateWay.tf            # NAT Gateway definitions
│   ├── output.tf                # Output variables for VPC (e.g., VPC ID, subnet IDs)
│   ├── route-table-assoc.tf     # Route table associations
│   ├── routeTable.tf            # Route table definitions
│   ├── subnet.tf                # Subnet definitions (e.g., public and private subnets)
│   ├── variable.tf              # Variables specific to VPC (e.g., CIDR block, availability zones)
│   └── vpc.tf                   # VPC definitions (e.g., VPC CIDR block, VPC configurations)
└── s3_bucket/                   # S3 bucket resources module (if applicable)
    ├── main.tf                  # s3_bucket instance definitions
    └── variables.tf             # Variables specific to load balancer instances (e.g., load balancer type)
```
## Modules
1. EC2 Module (EC2_module/) : This module is responsible for creating EC2 instances. The main.tf file in this folder defines the EC2 instances' configuration, including their size, AMI ID, and security groups. Outputs like instance IDs are captured in outputs.tf.

2. VPC Module (VPC_module/) : This module handles VPC creation, including subnets, route tables, and the internet gateway. This modular approach enables better reuse across different projects. The main.tf defines the network resources, and the outputs.tf captures relevant information like VPC ID and subnet IDs.

3. Load Balancer Module (loadbalancer/) : This module defines both the ALB (public-facing) and NLB (private-facing) load balancers. It sets up listeners, target groups, and integrates with EC2 instances.

## Resources Created
1. VPC
    * Public and private subnets
    * Route tables and internet gateway
2. Application Load Balancer (ALB)
    * Handles incoming public traffic
    * Listeners and target groups to route requests to private EC2 instances via NLB
3. Network Load Balancer (NLB)
    * Balances traffic between internal EC2 instances
4. EC2 Instances
    * Hosts application servers (NGINX)
    * Hosts application servers (HTTPd)
5. Security Groups
    * Manage inbound and outbound traffic rules for ALB, NLB, and EC2 instances
  
## Requirements

1. Terraform v1.x
2. AWS CLI configured with the necessary credentials
3. A valid SSH key pair for accessing EC2 instances

## Usage
1. Clone the repository:
```
git clone https://github.com/Andrew-Adel/Terraform-ALB-to-NLB-Public-Private.git
cd Terraform-ALB-to-NLB-Public-Private

```
2. Initialize Terraform:

```
terraform init

```
3. Review and edit the variables in `terraform.tfvars` to customize the infrastructure for your environment.
4. check and plan
```
terraform plan
```
5. Apply the Terraform configuration:
```
terraform apply
```
6. Once complete, retrieve the Load Balancer DNS by running:
```
terraform output load_balancer_dns
```

# Author
Created by Andrew Adel

Find me on GitHub.
[![Find me on GitHub](https://img.shields.io/badge/GitHub-Profile-blue?logo=github)](https://github.com/Andrew-Adel)
