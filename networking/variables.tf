variable "mainvpc" {
  type = string
  default = "10.0.0.0/24"
}

variable "public_subnet" {
  type = string
  default = "10.0.0.128/26"
}

variable "public_subnet2" {
  type = string
  default = "10.0.0.128/26"
}

variable "private_subnet" {
  type = string
  default = "10.0.0.192/26"
}

variable "allowed_cidr_blocks" {
  type = string
  default = "99.99.99.0/24"
}