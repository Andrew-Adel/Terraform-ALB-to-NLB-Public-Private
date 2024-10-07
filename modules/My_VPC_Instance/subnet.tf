
resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnet-data

  vpc_id                  = aws_vpc.my-vpc-tf.id
  map_public_ip_on_launch = true

  cidr_block        = each.value[0]
  availability_zone = each.value[1]
  tags = {
    Name       = each.key,
    created-by = "Andrew-Adel"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each          = var.private_subnet-data
  vpc_id            = aws_vpc.my-vpc-tf.id
  cidr_block        = each.value[0]
  availability_zone = each.value[1]

  tags = {
    Name       = each.key,
    created-by = "Andrew-Adel"
  }
}