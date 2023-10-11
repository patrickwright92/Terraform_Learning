provider "aws" {
    region = "ap-southeast-2"
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = "my-vpc"
    cidr = "10.0.0.0/16"

    azs = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

    tags = {
        Terraform = "true"
        Environment = "dev"
    }
}

resource "aws_security_group" "allow_ssh_conn" {
    name = "allow ssh conn"
    description = "Allow SSH inbound traffic"

    ingress {
        description = "SSH into VPC"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP into VPC"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Outbound Allowed"
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "myec2" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.micro"
    key_name = "ec2-key"
    vpc_security_group_ids = [aws_security_group.allow_ssh_conn.id]
}

//terraform plan -refresh=false
//terraform plan -refresh=false -target=aws_security_group.allow_ssh_conn