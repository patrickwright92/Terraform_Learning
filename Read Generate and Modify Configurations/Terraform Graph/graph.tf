provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "myec2" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
    instance = aws_instance.myec2.id
    //vpc = true -> deprecated
}

resource "aws_security_group" "allow_tls" {
    name = "allow_tls"

    ingress {
        description = "TLS from VPC"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${aws_eip.lb.private_ip}/32"]
    }
}

//terraform graph > graphname.dot (graphviz.gitlab.io for visualisation)