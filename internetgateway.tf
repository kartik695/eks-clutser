resource "aws_internet_gateway" "eks-vpc-internet-gateway" {
  vpc_id = aws_vpc.aws-eks-vpc.id
  tags = {
    "Name" : "eks-igw"
  }

}






















