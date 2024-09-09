resource "aws_iam_role" "nodes-role" {
  name = "eks-node-group-nodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:Assumerole"
      Effect = "Allow"
      Principal = [{
        Service = "ec2.amazon.com"
      }]
    }]

    version = "2012-10-17"
  })

}




// we will be creating the policies that are required for creating the node
resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes-role.name

}




resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes-role.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes-role.name



}


/* 

SPOT Instances (also known as Spot Instances in AWS) are a type of cloud computing instance that lets you take advantage of unused capacity in the cloud at a lower cost than On-Demand Instances. Here’s how they work:

    Cost Savings: SPOT Instances can be significantly cheaper than On-Demand Instances, often up to 90% less. This is because you’re bidding on unused cloud capacity, which providers are willing to sell at a discount to maximize their resource utilization.

    Potential Interruptions: The trade-off for these cost savings is that SPOT Instances can be interrupted by the cloud provider. This happens when the cloud provider needs the capacity back or if your bid price is lower than the current spot price. When an interruption occurs, your instance can be terminated with little warning, though providers typically give you a few minutes’ notice before shutting down the instance.


*/
resource "aws_eks_node_group" "private-nodes" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "private-nodes"
  node_role_arn   = aws_iam_role.nodes-role.arn
  subnet_ids = [
    aws_subnet.private-subnet-ap-south-1a.id,
    aws_subnet.private-subnet-ap-south-1b.id

  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t2.micro"]
  // Basic auto scalling
  scaling_config {
    desired_size = 1
    max_size     = 5
    min_size     = 0
  }


  update_config {
    max_unavailable = 1
  }


  labels = {
    role = "general"
  }



  depends_on = [
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,



  ]
}



