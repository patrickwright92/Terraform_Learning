provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "myec2" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.micro"
}
// -replace replaced taint from v0.15.2
// terraform plan / apply -replace="aws_instance.myec2"