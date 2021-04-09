provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "amazon_linux" {
  count = 2
  ami = "ami-02f9ea74050d6f812"
  instance_type = "t2.micro"
  tags = {
    Name = "Made by Terraform"
  }
}
