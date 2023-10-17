provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "myec2" {
    ami = "ami-06e2b86bab2edf4ee"
    for_each = {
      "key1" = "t2.micro"
      "key1" = "t2.medium"
    }
    instance_type = each.value
    key_name = each.key
    tags = {
        Name = each.value
    }
}