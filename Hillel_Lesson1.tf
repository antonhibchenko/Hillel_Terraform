locals {
  common_tags = {
    Purpose = "Education"
    Project = "Hillel"
    Class   = "Class 17"
  }
}

provider "aws" {
  region = "eu-central-1"
}
resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type                 // HOMEWORK: change to a variable (type — string)
  vpc_security_group_ids = [aws_security_group.this.id]
  key_name = "Hillel_Key"
  //  HOMEWORK hint - key_name = ""
  tags = local.common_tags
}

resource "aws_key_pair" "Hillel_Key" {
  key_name   = "Hillel_Key"
  public_key = var.aws_key_pair
}
// HOMEWORK: describe aws_key_pair resource
//           define keypair via variable (type string) with default value (your own public key)
//           https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair

resource "aws_eip" "this" {
  count    = (var.eip_attach ? 1 : 0)
  instance = aws_instance.this.id
  tags     = local.common_tags
}

resource "aws_security_group" "this" {
  name_prefix = "temporary"
  description = "Temporary SG for hillel class 17"
  tags        = local.common_tags

  egress { // allow outgoing traffic to anywhere
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group_rule" "SSH" {
  description       = "Allow SSH from anywhere. It is insecure but we are brave!"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}
resource "aws_security_group_rule" "HTTP" {
  description       = "Allow plain HTTP from anywhere"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}
resource "aws_security_group_rule" "HTTPS" {
  description       = "Allow secured HTTPS from anywhere"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}