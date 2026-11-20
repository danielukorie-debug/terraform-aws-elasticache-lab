output "replication_group_id" {
  description = "Planned Valkey replication group identifier."
  value       = aws_elasticache_replication_group.valkey.id
}

output "primary_endpoint" {
  description = "Valkey primary endpoint, available after deployment."
  value       = aws_elasticache_replication_group.valkey.primary_endpoint_address
}

output "security_group_id" {
  description = "Security group ID, available after deployment."
  value       = aws_security_group.valkey.id
}
