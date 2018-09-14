variable "instance_identifier" {
  description = "A unique identifier for this instance of the stack."
}

variable "environment_name" {
  description = "An identifier to link a collection of stack instances that work together."
}

variable "vpc_cidr" {
  description = "The CIDR to use for the VPC."
  default     = "10.1.0.0/16"
}

variable "region" {
  description = "The region into which to deploy the stack."
  default     = "eu-west-1"
}

variable "availability_zones" {
  description = "The availability zones for which to add subnets."
  default     = "eu-west-1a,eu-west-1b,eu-west-1c"
}

variable "aws_profile" {
  description = "The profile in ~/.aws/credentials to use."
  default     = "default"
}

variable "assume_role_arn" {
  description = "The IAM role to assume."
  default     = ""
}
