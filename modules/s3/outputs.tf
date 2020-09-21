# Module      : S3 BUCKET
# Description : Terraform module to create default S3 bucket with logging and encryption
#               type specific features.
output "id" {
  value       = aws_s3_bucket.s3_default.*.id
  description = "The ID of the s3 bucket."
}
output "bucket_regional_domain_name" {
  value       = aws_s3_bucket.s3_default.*.bucket_regional_domain_name
  description = "Regional Domain Name."
}
