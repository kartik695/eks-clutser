resource "aws_vpc" "aws-eks-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" : "aws-eks-cluster"
  }

}







