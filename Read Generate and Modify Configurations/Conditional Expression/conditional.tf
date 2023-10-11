provider "aws" {
  region = "ap-southeast-2"
}

variable "is_test" {}

resource "aws_instance" "dev" {
  ami           = "ami-06e2b86bab2edf4ee"
  instance_type = "t2.micro"
  // if statement - condition ? true_val : false_val (not 1/0 as in T/F but an actual int value to be assigned after evaluation)
  count = var.is_test == true ? 1 : 0
}

resource "aws_instance" "prod" {
  ami           = "ami-06e2b86bab2edf4ee"
  instance_type = "t2.large"
  count         = var.is_test == false ? 1 : 0
}