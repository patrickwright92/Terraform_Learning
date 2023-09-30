provider "aws" {
    region = "ap-southeast-2"
}

// creates an elastic IP address in AWS EC2
resource "aws_eip" "lb" {
  domain   = "vpc"
}

// creates an elastic IP address in AWS EC2
resource "aws_eip" "lb2" {
  domain   = "vpc"
}

// aws security group example code
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    // referenced to lb eip not lb2 - format particularly important
    cidr_blocks      = ["${aws_eip.lb.public_ip}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}