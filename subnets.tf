resource "aws_subnet" "private-subnet-ap-south-1a" {
  vpc_id            = aws_vpc.aws-eks-vpc.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.0.0/19"
  tags = {
    "Name"                           = "private-ap-south-1a"
    "kubernetes.io/role/internal-lb" = "1"
    "kubernetes.io/cluster/demo"     = "owned"
  }

}

resource "aws_subnet" "private-subnet-ap-south-1b" {
  vpc_id            = aws_vpc.aws-eks-vpc.id
  availability_zone = "ap-south-1b"
  cidr_block        = "10.0.32.0/19"
  tags = {
    "Name"                           = "private-ap-south-1b"
    "kubernetes.io/role/internal-lb" = "1"
    "kubernetes.io/cluster/demo"     = "owned"
  }

}


resource "aws_subnet" "public-subnet-ap-south-1a" {
  vpc_id            = aws_vpc.aws-eks-vpc.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.64.0/19"
  tags = {
    "Name"                           = "public-ap-south-1a"
    "kubernetes.io/role/internal-lb" = "1"
    "kubernetes.io/cluster/demo"     = "owned"
  }

  map_public_ip_on_launch = true

}


resource "aws_subnet" "public-subnet-ap-south-1b" {
  vpc_id            = aws_vpc.aws-eks-vpc.id
  availability_zone = "ap-south-1b"
  cidr_block        = "10.0.96.0/19"
  tags = {
    "Name"                           = "public-ap-south-1b"
    "kubernetes.io/role/internal-lb" = "1"
    "kubernetes.io/cluster/demo"     = "owned"
  }

  map_public_ip_on_launch = true

}