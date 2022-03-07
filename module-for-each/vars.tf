variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-south-1 = "ami-0af25d0df86db00c1"
    us-west-2  = "ami-06b94666"
    eu-west-1  = "ami-844e0bf7"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}

variable "bucketname" {
  type        = string
  description = "(required since we are not using 'bucket') Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
  default     = "tflstate1"
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A mapping of tags to assign to the bucket."
  default = {
    environment = "UDEMY"
    terraform   = "true"
  }
}

variable "versioning" {
  type        = bool
  description = "(Optional) A state of versioning."
  default     = true
}

variable "acl" {
  type        = string
  description = " Defaults to private "
  default     = "private"
}