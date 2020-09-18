# Module      : S3 BUCKET
# Description : Terraform module which creates S3 bucket with logging resource on AWS
resource "aws_s3_bucket" "s3_default" {
  count = var.create_bucket && var.bucket_logging_encryption_enabled == true ? 1 : 0

  bucket        = var.name
  force_destroy = var.force_destroy
  acl           = var.acl

  versioning {
    enabled = var.versioning
  }

  #   lifecycle_rule {
  #     id      = "transition-to-infrequent-access-storage"
  #     enabled = var.lifecycle_infrequent_storage_transition_enabled

  #     prefix = var.lifecycle_infrequent_storage_object_prefix

  #     transition {
  #       days          = var.lifecycle_days_to_infrequent_storage_transition
  #       storage_class = "STANDARD_IA"
  #     }
  #   }

  #   lifecycle_rule {
  #     id      = "transition-to-glacier"
  #     enabled = var.lifecycle_glacier_transition_enabled

  #     prefix = var.lifecycle_glacier_object_prefix

  #     transition {
  #       days          = var.lifecycle_days_to_glacier_transition
  #       storage_class = "GLACIER"
  #     }
  #   }

  #   lifecycle_rule {
  #     id      = "expire-objects"
  #     enabled = var.lifecycle_expiration_enabled

  #     prefix = var.lifecycle_expiration_object_prefix

  #     expiration {
  #       days = var.lifecycle_days_to_expiration
  #     }
  #   }
  logging {
    target_bucket = var.target_bucket
    target_prefix = var.target_prefix
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.kms_master_key_id
      }
    }
  }

}