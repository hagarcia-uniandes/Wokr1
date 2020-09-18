variable "domain" {
  description = "DNS domain zone"
  type        = string
}
variable "bucket_name" {
  description = "Bucket name"
  type        = string
}
variable "project" {
  type = string
}
variable "environment" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "sse" {
  description = "sse algorithm"
  type        = string
}
variable "kms_s3" {
  description = "The AWS KMS master key ID used for the SSE-KMS encryption."
  type        = string
}
variable "log_bucket" {
  description = "The name of the bucket that will receive the log objects."
  type        = string  
}
variable "log_prefix" {
  description = "To specify a key prefix for log objects."
  type        = string  
}
# variable "ami_id" {
#   type = list(string)
# }
# variable "instance_type" {
#   type = list(string)
# }
# variable "private_subnet_ids" {
#   type = list(string)
# }
# variable "public_subnet_ids" {
#   type = list(string)
# }
# variable "vpc_id" {
#   type = string
# }
# variable "kms_backup" {
#   type = string
# }
# variable "rule_name" {
#   type = list(string)
# }
# variable "service_name" {
#   type = list(string)
# }
# variable "provider_cloud" {
#   type = string
# }
# variable "region_cloud" {
#   type = string
# }
# variable "ou_cloud" {
#   type = string
# }
# variable "service_cloud" {
#   type = string
# }
# variable "percentage" {
#   type = list(string)
# }
# variable "metric_name" {
#   type = list(string)
# }
# variable "namespace" {
#   type = list(string)
# }
# variable "metric" {
#   type = list(string)
# }
# variable "service_type" {
#   type = list(string)
# }
# variable "kms_ebs" {
#   type = string
# }
# variable "volume_size" {
#   type = list(number)
# }
# variable "key_name" {
#   type = string
# }
# variable "alb_internal" {
#   description = " If true, the LB will be internal"
#   type        = list(string)
# }
# variable "resource_type" {
#   type = list(string)
# }
# variable "server_service" {
#   type = list(string)
# }
# variable "nic" {
#   type = list(string)
# }
# variable "kms_efs" {
#   type = string
# }