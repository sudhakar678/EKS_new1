resource "aws_route_table_association" "public-RTA" {
  subnet_id      = aws_subnet.public-SUB-01.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-RTA-1" {
  subnet_id      = aws_subnet.public-SUB-02.id
  route_table_id = aws_route_table.public.id
}
