variable "ami_id" {
  default = "ami-0502e817a62226e03"
  description = "EC2 instance Linux"
}

variable "instance_type" {
  default = "t3.micro"
  description = "EC2 instance type"
}

variable "eip_attach" {
  type = bool
  default = true
  description = "Attach Elastic IP to instance"
}

variable "ssh_public_key" {
  default = "UbuntuTest"
  description = "Key in AWS"
}