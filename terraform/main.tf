terraform {
  required_version = ">=1.6.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.15.0"
    }
  }
}

provider "aws" {
  region = var.region

  # Toggle LocalStack compatibility per environment via variable
  # Keep these skips enabled to avoid STS/account lookups during offline planning
  # (safe for sandbox and cost analysis). Endpoints remain gated by use_localstack.
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  skip_region_validation      = true
  s3_use_path_style           = var.use_localstack

  # Inject LocalStack endpoints only when sandbox is enabled
  dynamic "endpoints" {
    for_each = var.use_localstack ? [1] : []
    content {
      s3           = "http://localhost:4566"
      dynamodb     = "http://localhost:4566"
      sqs          = "http://localhost:4566"
      sns          = "http://localhost:4566"
      iam          = "http://localhost:4566"
      sts          = "http://localhost:4566"
      lambda       = "http://localhost:4566"
      apigateway   = "http://localhost:4566"
      logs         = "http://localhost:4566"
      ec2          = "http://localhost:4566"
      elbv2        = "http://localhost:4566"
      autoscaling  = "http://localhost:4566"
      rds          = "http://localhost:4566"
      elasticache  = "http://localhost:4566"
      cloudwatch   = "http://localhost:4566"
      acm          = "http://localhost:4566"
      route53      = "http://localhost:4566"
      kms          = "http://localhost:4566"
    }
  }
}

locals {
  project = "simple-web-server"
}
