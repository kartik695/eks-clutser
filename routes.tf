# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.aws-eks-vpc.id
#   tags = {
#     "Name" : "eks-private-route-table"
#   }

#   route = [
#     {
#       cidr_block     = "0.0.0.0/0"
#       nat_gateway_id = aws_nat_gateway.nat.id

#     }
#   ]
# }


# resource "aws_route_table" "pubic" {
#   vpc_id = aws_vpc.aws-eks-vpc.id
#   tags = {
#     tags = {
#       "Name" : "eks-public-route-table"
#     }
#   }




#   route = [
#     {
#       cidr_block     = "0.0.0.0/0"
#       nat_gateway_id = aws_internet_gateway.eks-vpc-internet-gateway.id

#     }
#   ]
# }



# resource "aws_route_table_association" "private-ap-south-1a" {
#   subnet_id      = aws_subnet.private-subnet-ap-south-1a.id
#   route_table_id = aws_route_table.private.id

# }

# resource "aws_route_table_association" "private-ap-south-1b" {
#   subnet_id      = aws_subnet.private-subnet-ap-south-1b.id
#   route_table_id = aws_route_table.private

# }

# resource "aws_route_table_association" "public-ap-south-1a" {
#   subnet_id      = aws_subnet.public-subnet-ap-south-1a.id
#   route_table_id = aws_route_table.pubic.id

# }



# resource "aws_route_table_association" "public-ap-south-1b" {
#   subnet_id      = aws_subnet.public-subnet-ap-south-1b.id
#   route_table_id = aws_route_table.pubic.id

# }













































resource "aws_route_table" "private" {
  vpc_id = aws_vpc.aws-eks-vpc.id
  tags = {
    "Name" : "eks-private-route-table"
  }


}


resource "aws_route_table" "pubic" {
  vpc_id = aws_vpc.aws-eks-vpc.id
  tags = {

    "Name" : "eks-public-route-table"

  }





}



resource "aws_route" "private_routes" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}


resource "aws_route" "public_routes" {
  route_table_id         = aws_route_table.pubic.id
  gateway_id             = aws_internet_gateway.eks-vpc-internet-gateway.id
  destination_cidr_block = "0.0.0.0/0"

}

resource "aws_route_table_association" "private-ap-south-1a" {
  subnet_id      = aws_subnet.private-subnet-ap-south-1a.id
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "private-ap-south-1b" {
  subnet_id      = aws_subnet.private-subnet-ap-south-1b.id
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "public-ap-south-1a" {
  subnet_id      = aws_subnet.public-subnet-ap-south-1a.id
  route_table_id = aws_route_table.pubic.id

}



resource "aws_route_table_association" "public-ap-south-1b" {
  subnet_id      = aws_subnet.public-subnet-ap-south-1b.id
  route_table_id = aws_route_table.pubic.id

}




