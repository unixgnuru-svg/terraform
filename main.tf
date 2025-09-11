terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}
provider "aws" {
    region = "us-east-1"
       
}

resource "aws_instance" "example"{
    ami = "ami-0b09ffb6d8b58ca91"
    instance_type = "t2.micro"
    tags = {
        Name = "EXAMPLE"
        ENV = "DEV"
        Project = "Terraform"
    }
    ebs_block_device {
        device_name = "/dev/xvdb"
        volume_size = 8
        volume_type = "gp3"
        delete_on_termination = true
        tags = {
            Name = "example-ebs"
           } 
      }
}