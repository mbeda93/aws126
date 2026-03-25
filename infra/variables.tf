variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
    description = "The ID of the AMI to use for EC2 instances"
    type        = string
    default     = "ami-0f3caa1cf4417e51b"
  
}

variable "instance_profile_name" {
    description = "The name of the IAM instance profile to associate with EC2 instances"
    type        = string
    default     = "LabInstanceProfile"
  
}