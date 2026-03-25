terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
import {
  to = aws_cognito_user_pool.xpix
  id = "us-east-1_5ab4YqG5p"
}

import {
  to = aws_cognito_user_pool_client.xpix
  id = "us-east-1_5ab4YqG5p/1671s5u6ndt30hvp78c1oinr7q"
}
