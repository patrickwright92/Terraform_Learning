provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "myec2" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloWorld"
    }
    // for customising the behaviour of the resource block
     lifecycle {
        ignore_changes = [ tags ]
     }
}