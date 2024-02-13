# --- networking/main.tf ---

resource "random_integer" "random" {
  min = 1
  max = 100
}

resource "aws_vpc" "k3s_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "k3s_vpc-${random_integer.random.id}"
  }
}

resource "aws_subnet" "k3s_public_subnet" {
  count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.k3s_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = ["eu-north-1a", "eu-north-1b", "eu-north-1c"][count.index]

  tags = {
    Name = "k3s_public_${count.index + 1}"
  }
}