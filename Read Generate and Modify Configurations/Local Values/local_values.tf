provider "aws" {
    region = "ap-southeast-2"
}

locals {
    common_tags = {
        Owner = "DevOps Team"
        service = "backend"
    }
}

resource "aws_instance" "app-dev" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.micro"
    tags = local.common_tags
}

resource "aws_instance" "db-dev" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.small"
    tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
    availability_zone = "ap-southeast-2"
    size = 8
    tags = local.common_tags
}
