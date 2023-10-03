resource "var.vpc_name" {             
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws.vpc_default.id
}

resource "public_subnet" {
  count                   = 2
  vpc_id                  = aws.vpc_default.id
  cidr_block              = var.public_subnet  
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

}

resource "private_subnet" {
  count              = 2
  vpc_id             = aws.vpc_default.id
  cidr_block         = var.private_subnet
  availability_zone  = "eu-central-1a"
  
}

resource "nat_gateway"  {
  count                 = "length(public_subnet)"
  subnet_id             = var.public_subnet.id
  allocation_id         = aws_eip.example.id
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
}

resource "aws_route_table" "route_table" {
  vpc_id = aws.vpc_default.id
  
}
