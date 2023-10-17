resource "aws_instance" "myec2" {
    ami = "ami-06e2b86bab2edf4ee"
    // designed as variable so it may be overriden if required
    instance_type = var.instance_type
    security_groups = ["default"]
    key_name = "remotepractical"
}