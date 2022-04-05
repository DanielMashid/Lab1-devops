# Leb1 --> Daniel Mashid 204609473
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create a VPC --> dev-vpc
resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "key" = "value"
  }
}
# Create a subnet --> Web Tier
resource "aws_subnet" "web-tier" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.1.0/27"

  tags = {
    Name = "Web Tier"
  }
}
# Create a subnet --> App Tier
resource "aws_subnet" "app-tier" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.2.0/27"

  tags = {
    Name = "App Tier"
  }
}
# Create a subnet --> DB Tier
resource "aws_subnet" "db-tier" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.3.0/28"

  tags = {
    Name = "DB Tier"
  }
}