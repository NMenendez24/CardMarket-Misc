provider "aws" {
  region = "sa-east-1"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "default"
}

resource "aws_instance" "testing" {
  ami           = "ami-0af6e9042ea5a4e3e"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    aws_security_group.testing.id
  ]

  tags = {
    Name = "Deployment"
  }

  user_data = <<-EOF
    #!/bin/bash
    git clone https://github.com/NMenendez24/CardMarket-Misc.git
    cd CardMarket-Misc
    sudo ./docker-scripts.sh
    EOF
}

resource "aws_security_group" "testing" {
  name        = "testing-security-group"
  description = "Testing security group"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#  ingress {
#    from_port   = 3306
#    to_port     = 3306
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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
