// oidc -> open id connect used for providing permission to pods 

data "tls_certificate" "eks" {
    url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks-openid" {
    client_id_list = ["sts.amazon.com"] // aws security token service
    thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
    url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
  
}