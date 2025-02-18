provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" example {
    ami = "ami-04b4f1a9cf54c11d0"
    instance_type = "t2.micro"
    subnet_id = "subnet-003a2d01bf1d10f84"
    key_name = "ec2login"
}
