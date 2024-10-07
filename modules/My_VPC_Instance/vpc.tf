
resource "aws_vpc" "my-vpc-tf" {
  cidr_block = var.my-vpc-cidr
  tags = {
    Name       = "terraform-vpc",
    created-by = "Andrew-Adel"
  }
}
