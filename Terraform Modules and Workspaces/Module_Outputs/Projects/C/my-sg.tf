module "sgmodule" {
    source = "../../Modules/sg"
}

resource "aws_instance" "web" {
    ami = "ami-06e2b86bab2edf4ee"
    instance_type = "t2.micro"
                            //module.modulename.outputname
    vpc_security_group_ids = [module.sgmodule.sg-id]
}