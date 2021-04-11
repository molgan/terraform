provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "jenkins_server" {
  ami = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  key_name = "aws_key"
  vpc_security_group_ids = [aws_security_group.jenkins_sg_8080.id]
  tags = {
    Name = "Jenkins from Terraform"
  } 

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/crash_course/secret/aws_key")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sh /tmp/script.sh",
    ]
  }
}

resource "aws_security_group" "jenkins_sg_8080" {
  name = "jenkins_sg_8080"
  description = "Security group allows port 8080 TCP for Jenkins"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
