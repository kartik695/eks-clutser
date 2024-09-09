resource "aws_eks_cluster" "eks_cluster" {
  name = "eks_cluster"
  // remember here we are refering complete rle_arn
  // why we are using role_arn instaed of role croos-account-consideration-> suppose you are having too many accounts the ARN helps in resolving ambiguities and ensuring that the correct role is used.
  // Unique Identification: The ARN provides a unique identifier for the IAM role, ensuring that EKS can accurately identify and use the role across different AWS accounts and regions.
  role_arn = aws_iam_role.eks_policy.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-subnet-ap-south-1a.id,
      aws_subnet.private-subnet-ap-south-1b.id,
      aws_subnet.public-subnet-ap-south-1a.id,
      aws_subnet.public-subnet-ap-south-1b.id

    ]
  }
  // it will depends on amazon eks policy

  depends_on = [aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy]
}