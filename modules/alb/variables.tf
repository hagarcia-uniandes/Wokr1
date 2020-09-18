/*variable "stack_id" {
  type        = string
  description = "The prefix to identify the resources created by the module"
}*/
variable "vpc_id" {
  type        = string
  description = "the id of the vpc to provision with the ALB"
}

variable "alb_internal" {
  description = " If true, the LB will be internal"
  type        = list(string)
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "public_subnet_ids" {
  type = list(string)
}

variable "environment" {
  type = string
}

variable "service_type" {
  type = list(string)
}

variable "resource_type" {
  type = list(string)
}

variable "server_service" {
  type = list(string)
}

/*
#Logs
variable "alb_logs_enabled" {
  description = "Boolean to enable / disable access_logs"
  default     = false
}

variable "alb_bucket_logs" {
  type        = string
  description = "The S3 bucket name to store the logs in"
  default     = " "
}

variable "alb_bucket_prefix" {
  type        = string
  description = "The S3 bucket prefix. Logs are stored in the root if not configured"
  default     = " "
}

variable "zone_id" {
  type        = string
  description = "The DNS zone where you want to create a CNAME-type record for an INTERNAL ALB"
  default     = "null"
}
variable "subdomain" {
  type        = string
  description = "The subdomain to create a CNAME-type record for an INTERNAL ALB"
  default     = "null"
}
variable "tags" {
  type        = map(string)
  description = "Tags to attach to Resource."
}
variable "subnets_private" {
  type        = list(string)
  description = "The subnets private"
}
variable "ip_github_onpremise" {
  type        = list(string)
  description = "The direction IP of the server github onpremise"
}
variable "ip_ath_cidr" {
  type        = list(string)
  description = "The direction IP of the ath server"
}
variable "ip_cidr_monitoring" {
  type        = list(string)
  description = "The direction IP of the monitoring server"
}*/