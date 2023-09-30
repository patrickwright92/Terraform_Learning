provider "aws" {

}

resource "aws_instance" "myec2" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = var.list[1]
}

variable "list" {
    type = list
    default = ["m5.large", "m5.xlarge", "t2.medium"]
}

variable "types" {
    type = map
    default = {
        ap-southeast-1 = "t2.nano"
        ap-southeast-2 = "t2.micro"
        us-east-1 = "t2.small"
    }
}