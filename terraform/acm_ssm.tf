# # If you control Route53 hosted zone, we can request & validate with Terraform:
# data "aws_route53_zone" "zone" {
#   name         = replace(var.domain_name, "/^.*?\\./", "")
#   private_zone = false
# }

# resource "aws_acm_certificate" "cert" {
#   domain_name       = var.domain_name
#   validation_method = "DNS"
#   lifecycle { create_before_destroy = true }
# }

# resource "aws_route53_record" "cert_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       type   = dvo.resource_record_type
#       record = dvo.resource_record_value
#     }
#   }
#   zone_id = data.aws_route53_zone.zone.zone_id
#   name    = each.value.name
#   type    = each.value.type
#   ttl     = 60
#   records = [each.value.record]
# }

# resource "aws_acm_certificate_validation" "cert_val" {
#   certificate_arn         = aws_acm_certificate.cert.arn
#   validation_record_fqdns = [for r in aws_route53_record.cert_validation : r.fqdn]
# }

# resource "aws_ssm_parameter" "acm_cert_arn" {
#   name  = "/${var.project}/acm_cert_arn"
#   type  = "String"
#   value = aws_acm_certificate.cert.arn
# }
