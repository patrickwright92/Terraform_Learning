provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "myec2" {
    // ami for sydney zone
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = var.instancetype
}