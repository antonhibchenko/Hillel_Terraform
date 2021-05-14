output "elastic_ip" {
  value = aws_instance.this.public_ip
  depends_on = [aws_eip.this]
}