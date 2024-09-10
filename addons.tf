# Define CoreDNS addon
# resource "aws_eks_addon" "coredns" {
#   cluster_name = aws_eks_cluster.eks_cluster.name
#   addon_name   = "coredns"
# }

# Define kube-proxy addon
resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = "kube-proxy"
}

# Define Amazon VPC CNI addon // container network interface
resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = "vpc-cni"
}