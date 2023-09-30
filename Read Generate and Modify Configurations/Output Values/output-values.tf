provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_eip" "lb" {
    domain = "vpc"
}

output "public-ip" {
    // value = aws_eip.lb -> prints all associated attributes
    // value = aws_eip.lb.public_ip -> prints the public ip

    // outputs an entire url
    value = "https://${aws_eip.lb.public_ip}:8080"
}