resource "aws_elasticache_subnet_group" "valkey" {
  name       = "terraform-valkey-lab-subnets"
  subnet_ids = var.private_subnet_ids

  tags = {
    Project     = "terraform-aws-elasticache-lab"
    Environment = "learning"
    ManagedBy   = "Terraform"
  }
}

resource "aws_security_group" "valkey" {
  name        = "terraform-valkey-lab-sg"
  description = "Restricted security group for Valkey lab"
  vpc_id      = var.vpc_id

  ingress = []
  egress  = []

  tags = {
    Project     = "terraform-aws-elasticache-lab"
    Environment = "learning"
    ManagedBy   = "Terraform"
  }
}

resource "aws_elasticache_replication_group" "valkey" {
  replication_group_id = "terraform-valkey-lab"
  description          = "Terraform Valkey planning lab"

  engine         = "valkey"
  engine_version = "8.0"
  node_type      = "cache.t3.small"

  num_cache_clusters         = 1
  automatic_failover_enabled = false

  subnet_group_name  = aws_elasticache_subnet_group.valkey.name
  security_group_ids = [aws_security_group.valkey.id]

  at_rest_encryption_enabled = true
  transit_encryption_enabled = true

  tags = {
    Project     = "terraform-aws-elasticache-lab"
    Environment = "learning"
    ManagedBy   = "Terraform"
  }
}
