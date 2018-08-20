variable "deployment_identifier" {}
variable "component" {}
variable "estate" {}
variable "base_dns_domain" {}

variable "aws_profile" { default = "default" }
variable "assume_role_arn" { default = "" }
variable "region" { default = "eu-west-1" }
variable "availability_zones" { default = "eu-west-1a,eu-west-1b,eu-west-1c" }
