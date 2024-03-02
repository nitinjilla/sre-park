variable "aws_vpc_zone" {
  default     = "zone"
  type        = string
  description = "value for availability_zone in aws_subnet"
}

resource "aws_vpc" "vpc" {

  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "homelabs-vpc"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.aws_vpc_zone
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "homelabs-subnet-1"
  }
}