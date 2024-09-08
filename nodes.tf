# resource "aws_iam_role" "nodes-role" {
#   name = "eks-node-group-nodes"

#   assume_role_policy = jsondecode({
#     Statement = [{
#       Action = "sts:Assumerole"
#       Effect = "Allow"
#       Principal = [{
#         Service = "ec2.amazon.com"
#       }]
#     }]

#     version = "2012-10-17"
#   })

# }




# // we will be creating the policies that are required for creating the node
# resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role       = aws_iam_role.nodes-role.name

# }




# resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = aws_iam_role.nodes-role.name
# }

# resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = aws_iam_role.nodes-role.name

# }



