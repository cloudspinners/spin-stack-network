resource "aws_vpc" "base" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name               = "vpc-${var.instance_identifier}"
    InstanceIdentifier = "${var.instance_identifier}"
    EnvironmentName    = "${var.environment_name}"
  }
}
