resource "aws_route_table" "puplic_rw" {
  vpc_id = aws_vpc.depi_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.depi_gw12.id
  }

 
  tags = {
    Name = "puplic_rw"
  }
}
resource "aws_route_table" "private_rww" {
  vpc_id = aws_vpc.depi_vpc.id
#    route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.depi_gw12.id
#   }
  tags = {
    Name = "private_rww"
  }
}

resource "aws_route_table_association" "depi_rw_association" {
  subnet_id      = aws_subnet.puplic_supnet_12.id
  route_table_id = aws_route_table.puplic_rw.id
}


resource "aws_route_table_association" "depi_rw_private_association" {
  subnet_id      = aws_subnet.private_supnet_1.id
  route_table_id = aws_route_table.private_rww.id
}