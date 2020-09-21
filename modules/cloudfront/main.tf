##
# CloudFront Distribution
##
resource "aws_cloudfront_distribution" "main" {
  comment = var.name
  
  enabled         = true
  is_ipv6_enabled = true

  price_class = var.price_class

  aliases = var.root_domain != "" ? local.aliases : []

  origin {
    origin_id   = "default"
    domain_name = var.default_origin.domain_name
    origin_path = var.default_origin.origin_path
    custom_origin_config {
      http_port                = var.default_origin.custom_origin_config.http_port
      https_port               = var.default_origin.custom_origin_config.https_port
      origin_protocol_policy   = var.default_origin.custom_origin_config.origin_protocol_policy
      origin_ssl_protocols     = var.default_origin.custom_origin_config.origin_ssl_protocols
      origin_keepalive_timeout = var.default_origin.custom_origin_config.origin_keepalive_timeout
      origin_read_timeout      = var.default_origin.custom_origin_config.origin_read_timeout
    }
  }

  origin {
    origin_id   = "static"
    domain_name = var.default_origin.domain_name
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.static_bucket.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    target_origin_id       = "default"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
      headers = var.forwarded_headers
    }
    min_ttl     = 0
    max_ttl     = 86400
    default_ttl = 3600
    compress    = true
  }

  ordered_cache_behavior {
    path_pattern           = "${var.static_path}*"
    target_origin_id       = "static"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    viewer_protocol_policy = "redirect-to-https"
    forwarded_values {
      cookies {
        forward = "none"
      }
      query_string = false
      headers      = []
    }
    min_ttl     = 0
    max_ttl     = 86400
    default_ttl = 3600
    compress    = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = var.acm_certificate_arn == "" ? "" : "sni-only"
    cloudfront_default_certificate = var.acm_certificate_arn == "" ? true : false
    minimum_protocol_version       = var.minimum_tls_version
  }

  # web_acl_id = length(local.allowlist_ip) > 0 ? aws_waf_web_acl.ip_allowlist.0.id : null

  logging_config {
    include_cookies = false
    bucket          = var.target_bucket
    prefix          = var.target_prefix
  }
}

resource "aws_cloudfront_origin_access_identity" "static_bucket" {
  comment = var.name
}