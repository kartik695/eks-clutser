resource "aws_eip" "eks-vpc-nat-ip" {

  tags = {
    "Name" : "nat"
  }


}



resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eks-vpc-nat-ip.id
  subnet_id     = aws_subnet.public-subnet-ap-south-1a.id
  tags = {
    "Name" : "eks-nat-gateway"
  }

  depends_on = [aws_internet_gateway.eks-vpc-internet-gateway]

}