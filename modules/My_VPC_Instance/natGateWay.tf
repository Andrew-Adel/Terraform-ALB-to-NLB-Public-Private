resource "aws_nat_gateway" "natGateway" {
  allocation_id = aws_eip.nat-ip.id
  subnet_id     = aws_subnet.public_subnet["public_subnet-1"].id

  tags = {
    Name       = "gw-Nat"
    created-by = "Andrew-Adel"
  }
}