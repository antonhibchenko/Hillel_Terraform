variable "ami_id" {
  default = "ami-0502e817a62226e03"
  description = "EC2 instance Linux"
}

variable "instance_type" {
  default = "t3.micro"
  description = "EC2 instance type"
}

variable "aws_key_pair" {
  default = "exapmle.com"
  description = "Public key for connection"
}

variable "eip_attach" {
  type = bool
  default = true
  description = "Attach Elastic IP to instance"
}
