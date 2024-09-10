resource "aws_iam_role" "eks_policy" {
  name               = "eks-cluster-role-policy"
  assume_role_policy = <<POLICY
{
 "Version" : "2012-10-17",
 "Statement" : [
  {
  "Effect": "Allow",
  "Principal" : {
  "Service" : "eks.amazonaws.com"
  },
  "Action" : "sts:AssumeRole"
  }
 ]

}
  
POLICY  
}




/*


aws_iam_role: Defines and creates an IAM role and its trust policy (who can assume the role). It does not specify what permissions are granted.
aws_iam_role_policy_attachment: Attaches a specific policy to an IAM role. This grants the permissions defined in the policy to the role.

*/


resource "aws_iam_role_policy_attachment" "eks-AmazonEKSClusterPolicy" {


  // this resource block is used to attach iam policy to iam role
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  // policy arn is the policy amazon resource name it is fixed for each policy.
  role = aws_iam_role.eks_policy.name

}














