# --- networking/output.tf ---

output "vpc_id" {
  value = aws_vpc.k3s_vpc.id
}