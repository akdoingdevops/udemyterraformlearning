variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A mapping of tags to assign to the bucket."
  default = {
    environment = "UDEMY"
    terraform   = "true"
  }
}