variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project" {
  type    = string
  default = "react-devops"
}

variable "domain_name" {
  description = "Fully qualified domain to use for the app (e.g. app.example.com)"
  type        = string
  default = "value"
}

# CIDR and basic VPC options (adjust to your environment)
variable "vpc_cidr" { default = "10.0.0.0/16" }
