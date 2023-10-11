resource "aws_instance" "myec2" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.micro"
}

resource "aws_instance" "newec2" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.micro"
}

resource "aws_instance" "mynewec2" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.micro"
}