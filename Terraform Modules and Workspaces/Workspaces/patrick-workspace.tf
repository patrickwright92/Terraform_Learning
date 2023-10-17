provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "myec2" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = lookup(var.instance_type, terraform.workspace)
}

variable "instance_type" {
    type = map

    default = {
        default = "t2.nano"
        dev = "t2.micro"
        prod = "t2.large"
    }
}


//terraform workspace -h (shows all commands)
//terraform workspace show
//terraform workspace new dev (dev is name)
//terraform workspace list (lists all available workspaces)
//terraform workspace select dev/prod/default
// after apply - terraform.tfstate.d -> custom workspaces in there and individual terraform.tfstate files inside their workspaces
// if using default workspace tfstate file appears as normal