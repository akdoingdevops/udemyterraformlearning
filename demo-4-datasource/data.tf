data "aws_ami" "amazonlinux" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}