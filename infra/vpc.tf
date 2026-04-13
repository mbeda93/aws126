# VPC

resource "aws_vpc" "asmt" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

import {
  to = aws_vpc.asmt
  id = "vpc-02fc0008dac609d13"
}


# Subnets

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.asmt.id
  cidr_block        = "10.0.0.0/20"
  availability_zone = "us-east-1a"

  tags = { Name = "PIX-VPC-01-subnet-public1-us-east-1a" }
}

import {
  to = aws_subnet.public1
  id = "subnet-0a52a4be0b59a7315"
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.asmt.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = "us-east-1b"

  tags = { Name = "PIX-VPC-01-subnet-public2-us-east-1b" }
}

import {
  to = aws_subnet.public2
  id = "subnet-0a7307720ce83a16f"
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.asmt.id
  cidr_block        = "10.0.128.0/20"
  availability_zone = "us-east-1a"

  tags = { Name = "PIX-VPC-01-subnet-private1-us-east-1a" }
}

import {
  to = aws_subnet.private1
  id = "subnet-0bafeb3339a6ce1a5"
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.asmt.id
  cidr_block        = "10.0.144.0/20"
  availability_zone = "us-east-1b"

  tags = { Name = "PIX-VPC-01-subnet-private2-us-east-1b" }
}

import {
  to = aws_subnet.private2
  id = "subnet-0d769323efc424d24"
}


# Internet Gateway

resource "aws_internet_gateway" "asmt" {
  vpc_id = aws_vpc.asmt.id

  tags = { Name = "PIX-VPC-01-igw" }
}

import {
  to = aws_internet_gateway.asmt
  id = "igw-093143445d9ac475c"
}


# Route Tables

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.asmt.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.asmt.id
  }

  tags = { Name = "PIX-VPC-01-rtb-public" }
}

import {
  to = aws_route_table.public
  id = "rtb-0a6d9db19f896f2cf"
}

resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.asmt.id

  tags = { Name = "PIX-VPC-01-rtb-private1-us-east-1a" }
}

import {
  to = aws_route_table.private1
  id = "rtb-0d53a17f08b1eaa5e"
}

resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.asmt.id

  tags = { Name = "PIX-VPC-01-rtb-private2-us-east-1b" }
}

import {
  to = aws_route_table.private2
  id = "rtb-05d4086aee54c8e61"
}


# Route Table Associations
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

import {
  to = aws_route_table_association.public1
  id = "subnet-0a52a4be0b59a7315/rtb-0a6d9db19f896f2cf"
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

import {
  to = aws_route_table_association.public2
  id = "subnet-0a7307720ce83a16f/rtb-0a6d9db19f896f2cf"
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private1.id
}

import {
  to = aws_route_table_association.private1
  id = "subnet-0bafeb3339a6ce1a5/rtb-0d53a17f08b1eaa5e"
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private2.id
}

import {
  to = aws_route_table_association.private2
  id = "subnet-0d769323efc424d24/rtb-05d4086aee54c8e61"
}


# Security group

resource "aws_security_group" "xpix_app" {
  name        = "xpix-app-server"
  description = "xpix"
  vpc_id      = aws_vpc.asmt.id
}

import {
  to = aws_security_group.xpix_app
  id = "sg-0eba43789486ae4d2"
}


# Security group ingress rules

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = "sg-0eba43789486ae4d2"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "SSH"
}

import {
  to = aws_vpc_security_group_ingress_rule.ssh
  id = "sgr-0443e77cf3204bca1"
}
