provider "aws" {
    region  = "ap-southeast-2"
    access_key = "AKIAYP6BM3QUGGUEBK2T"
    secret_key = "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"
}


resource "aws_instance" "my_ec2" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.micro"
}
