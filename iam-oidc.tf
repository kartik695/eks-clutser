// oidc -> open id connect used for providing permission to pods 
// To manage permissions for your applications that you deploy in Kubernetes. You can either attach policies to Kubernetes nodes directly. In that case, every pod will get the same access to AWS resources. Or you can create OpenID connect provider, which will allow granting IAM permissions based on the service account used by the pod.

data "tls_certificate" "eks" {
    url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks-openid" {
    client_id_list = ["sts.amazon.com"] // aws security token service
    thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
    url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
  
}