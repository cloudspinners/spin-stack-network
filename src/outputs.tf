output "vpc_id" {
  description = "The ID of the created VPC."
  value = "${aws_vpc.base.id}"
}

output "vpc_cidr" {
  description = "The CIDR of the created VPC."
  value = "${aws_vpc.base.cidr_block}"
}

output "availability_zones" {
  description = "The availability zones in which subnets were created."
  value = "${var.availability_zones}"
}

output "number_of_availability_zones" {
  description = "The number of populated availability zones available."
  value = "${length(split(",",var.availability_zones))}"
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value = "${join(",", aws_subnet.public.*.id)}"
}

output "public_subnet_cidr_blocks" {
  description = "The CIDRs of the public subnets."
  value = "${join(",", aws_subnet.public.*.cidr_block)}"
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value = "${join(",", aws_subnet.private.*.id)}"
}

output "private_subnet_cidr_blocks" {
  description = "The CIDRs of the private subnets."
  value = "${join(",", aws_subnet.private.*.cidr_block)}"
}
