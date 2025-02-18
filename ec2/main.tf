provider "aws" {
    region = "us-east-1"
}

variable "ami_id" {
  description = "EC2 AMI ID"
  type = string
  default = "ami-04b4f1a9cf54c11d0"
}

variable "environment" {
  type = string
}

variable "prodsubnet" {
  type = string
  default = "10.0.2.0/24"
}

variable "devsubnet" {
  type = string
  default = "10.0.1.0/24"
}

variable "instance_type" {
  default = "t2.micro"
  type = string
  description = "instance type of ec2"
}

resource "aws_instance" example {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = "subnet-003a2d01bf1d10f84"
    key_name = "ec2login"
}

# conditional operation 

resource "aws_security_group" "ecs_sec" {
  name = "ecs-sg"
  description = "ecs security group"

  ingress = {
    from_port =22
    to_port = 22 
    protocol = "tcp"
    cidr_blocks = var.environment =="Production" ? [var.prodsubnet] : [var.devsubnet]
  }
}


output "public_ip" {
    value = aws_instance.example.public_ip
}