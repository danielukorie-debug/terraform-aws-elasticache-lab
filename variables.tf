variable "aws_region" {
  description = "AWS region for the ElastiCache lab."
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "Existing VPC ID."
  type        = string
  default     = "vpc-00e32019add7ce8fa"
}

variable "private_subnet_ids" {
  description = "Existing private subnet IDs."
  type        = list(string)

  default = [
    "subnet-02e4562134feeb8ae",
    "subnet-0113128309df4a78a"
  ]
}
