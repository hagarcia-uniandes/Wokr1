variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}
variable "application" {
  type        = string
  default     = ""
  description = "Application (e.g. `cd` or `clouddrove`)."
}
variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}
variable "create_bucket" {
  type        = bool
  default     = true
  description = "Conditionally create S3 bucket."
}
variable "bucket_logging_encryption_enabled" {
  type        = bool
  default     = false
  description = "Enable logging encryption of S3."
}
variable "versioning" {
  type        = bool
  default     = false
  description = "Enable Versioning of S3."
}
variable "acl" {
  type        = string
  default     = ""
  description = "Canned ACL to apply to the S3 bucket."
}
variable "force_destroy" {
  type        = bool
  default     = false
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
}
variable "target_bucket" {
  type        = string
  default     = ""
  description = "The name of the bucket that will receive the log objects."
}
variable "target_prefix" {
  type        = string
  default     = ""
  description = "To specify a key prefix for log objects."
}
variable "sse_algorithm" {
  type        = string
  default     = "AES256"
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms."
}
variable "kms_master_key_id" {
  type        = string
  default     = ""
  description = "The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms."
}
variable "bucket_enabled" {
  type        = bool
  default     = false
  description = "Enable simple S3."
}
variable "website_hosting_bucket" {
  type        = bool
  default     = false
  description = "Enable website hosting of S3."
}
