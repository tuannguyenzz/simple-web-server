variable "region" {
  description = "aws region"
  type        = string
  default     = "ap-southeast-1"
}

variable "use_localstack" {
  type        = bool
  description = "Toggle LocalStack sandbox behavior in Terraform"
  default     = true
}

variable "localstack_ami_id" {
  type        = string
  description = "Placeholder AMI used when use_localstack=true"
  default     = "ami-12345678"
}

variable "asg_ami_id" {
  description = "AMI used for ASG when not using LocalStack"
  type        = string
  default     = "ami-0abcde1234567890f"
}
