provider "aws" {
    region = "ap-southeast-2"
}

variable "iam_names" {
    type = list
    default = ["user-01", "user-02", "user-03", "user-04"]
}

resource "aws_iam_user" "iam" {
    name = var.iam_names[count.index]
    count = 4
    path = "/system/"
}