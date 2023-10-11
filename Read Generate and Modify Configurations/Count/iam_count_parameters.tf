provider "aws" {
    region = "ap-southeast-2"
}

variable "elb_names" {
    type = list
    default = ["dev-loadbalancer", "stage-loadbalancer", "prod-loadbalancer"]
}

resource "aws_iam_user" "lb" {
    name = var.elb_names[count.index]
    count = 3
    path = "/system/"
}