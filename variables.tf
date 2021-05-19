variable "ami_id" {
  default = "ami-0502e817a62226e03"
  description = "EC2 instance Linux"
}

variable "instance_type" {
  default = "t3.micro"
  description = "EC2 instance type"
}

variable "aws_key_pair" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYwIkmnFu5vhn7+a5658FdCp5NmNRa2yVZcJ+N6h5TpsoGqNzvaETwvzVvzVSPkgeO3jPhT/fBHselBbD6c60S6/AtL2/r4gYZVil9N+GWVAzcxtkHE6fi8fok9PlvqAZKz0icVs+D8DR+oQiL/aHMMt1pcyYOKnljE4RMYk6hae0gHpiFvxmf/RngFk/KjJSBNwJJtvGspfHnjICEkzHiJPvbJjfYO+rYiHx4DOCw4S5Dbssvq5vNW+WodxoEN/FOLtDhxpCbdfQWfgnHnMoSk5lslelrhvHZyP+2D35NbwlO31+mPLCt/FNnelEBjZw8jw8EfPgVNJbLpnflrFxt UbuntuTest"
  description = "Public key for connection"
}

variable "eip_attach" {
  type = bool
  default = true
  description = "Attach Elastic IP to instance"
}
