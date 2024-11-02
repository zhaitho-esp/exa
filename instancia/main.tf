provider "aws" {
  region = var.region_blockstellart
}

# Crea un grupo de seguridad para SSH y HTTP
resource "aws_security_group" "web" {
  name        = "examenfinal"
  description = "Security group para permitir SSH y HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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


# Crea una Instancia EC2
resource "aws_instance" "blockStellart" {
  ami         =  "ami-07caf09b362be10b8"
  instance_type   = "t2.micro"
  security_group  = [aws_security_group.web.name] 
}

tags = {
  Name = "examenfinal"
}

