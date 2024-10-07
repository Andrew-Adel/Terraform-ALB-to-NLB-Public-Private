resource "aws_route_table_association" "public-assoc" {
  for_each = var.public_subnet-data

  subnet_id      = aws_subnet.public_subnet[each.key].id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private-assoc" {
  for_each = var.private_subnet-data

  subnet_id      = aws_subnet.private_subnet[each.key].id
  route_table_id = aws_route_table.private-route-table.id
}