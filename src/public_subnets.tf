resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.base.id}"
  count             = "${length(split(",", var.availability_zones))}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, count.index)}"
  availability_zone = "${element(split (",", var.availability_zones), count.index)}"

  tags {
    Name               = "public-subnet-${var.instance_identifier}-${element(split (",", var.availability_zones), count.index)}"
    InstanceIdentifier = "${var.instance_identifier}"
    EnvironmentName    = "${var.environment_name}"
  }
}
