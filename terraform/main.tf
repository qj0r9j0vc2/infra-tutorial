# providers.tf
terraform {
  required_providers { aws = { source = "hashicorp/aws" version = "~> 5.0" } }
}
provider "aws" { region = var.region }

# variables.tf
variable "region" {
  type = string
  default = "ap-northeast-2"
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t3.small"
}

# main.tf
resource "aws_instance" "demo" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags          = { Name = "tf-demo" }
}
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter { name = "name" values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"] }
}
