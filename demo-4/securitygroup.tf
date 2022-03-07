resource "aws_security_group" "allow_tls" {
  name        = "allowtraffic"
  description = "Allow  inbound traffic"

  dynamic "ingress" {
    for_each = [80, 22]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      description = "tfsg"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = [0]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      description = "tfsg"
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # ingress {
  #   description      = "ssh port"
  #   from_port        = 22
  #   to_port          = 22
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }

  # ingress {
  #   description      = "http port"
  #   from_port        = 80
  #   to_port          = 80
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }

  tags = {
    Name = "terraformlearning"
  }
}