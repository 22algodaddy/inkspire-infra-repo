output "ecr_repo_url" {
  value = aws_ecr_repository.react.repository_url
}

# output "acm_cert_arn" {
#   value = aws_acm_certificate.cert.arn
# }

output "eks_cluster_name" {
  value = module.eks.cluster_id
}


