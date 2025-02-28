provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "cicddeploy" {
  ami = "ami-001ac4fa04c1e3743"
  instance_type = "t2.micro"
}

output "public-ip-address" {
  value = aws_instance.ec21.public_ip
}
output "ec2-arn" {
  value = aws_instance.ec21.arn
}

output "hostid" {
  value = aws_instance.ec21.host_id
}