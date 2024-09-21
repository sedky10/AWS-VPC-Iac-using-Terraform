resource "aws_vpc" "depi_vpc" {
  cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

  tags = {
    Name = "depi-vpc"
  }
}

resource "aws_subnet" "puplic_supnet_12" {
  vpc_id     = aws_vpc.depi_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "depi_puplic_supnet_1"
  }
}

resource "aws_subnet" "private_supnet_1" {
  vpc_id     = aws_vpc.depi_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "depi_private_supnet_1"
  }
}


resource "aws_internet_gateway" "depi_gw12" {
  vpc_id = aws_vpc.depi_vpc.id

  tags = {
    Name = "depi-igw"
  }
}
# resource "aws_internet_gateway" "depi_gw1" {
#   vpc_id = aws_vpc.depi_vpc.id

#   tags = {
#     Name = "depi-igw1"
#   }
# }
