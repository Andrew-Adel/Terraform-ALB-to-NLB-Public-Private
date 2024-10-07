resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc-tf.id


  tags = {
    "Name" = "Main"
  }
}