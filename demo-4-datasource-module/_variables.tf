variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "AWS_REGION" {
  type = string
  default = "ap-south-1"
}

variable "image_name" {
  type = string
  default = "amzn2-ami-kernel-5.10-hvm-2.0.20211223.0-x86_64-gp2"
}