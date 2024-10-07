# Terraform-ALB-to-NLB-Public-Private-Arch
This project implements a public-private architecture on AWS using Terraform. It uses an Application Load Balancer (ALB) for public-facing traffic, which redirects requests to a public EC2S which redirect requests to a Network Load Balancer (NLB) for private resources, such as EC2 instances hosted in a Virtual Private Cloud (VPC). The infrastructure is designed to be highly available and scalable.

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
