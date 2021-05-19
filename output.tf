output "elastic_ip" {
  value     = var.eip_attach == true ? aws_eip.this.0.public_ip : "eip not attached or defined" //
  depends_on = [aws_eip.this]
}

output "instance_pub_ip" {
  value     = var.eip_attach == true ? aws_eip.this.0.public_ip : aws_instance.this.public_ip // HOMEWORK: show elastic ip (aws_eip) value if one is associated.
  // https://www.terraform.io/docs/configuration/expressions/conditionals.html
  // https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip#attributes-reference
  sensitive = false
}
output "instance_pub_dns" {
  value = aws_instance.this.public_dns
}