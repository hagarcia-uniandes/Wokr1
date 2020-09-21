# Route53 module configuration. This module will create the necessary DNS records.
module "route53" {
  source = "./modules/route53"

  application = var.project
  environment = var.environment
  #private_enabled = true
  public_enabled = true
  record_enabled = true

  domain_name = var.domain
  #vpc_id      = "vpc-xxxxxxxxxxxx"

  #secondary_vpc_id     = "vpc-xxxxxxxxxxxxxx"
  #secondary_vpc_region = "eu-west-1"

  names = [
    "www.",
    "admin."
  ]
  types = [
    "CNAME",
    "CNAME"
  ]
  ttls = [
    "3600",
    "3600",
  ]
  values = [
    "mydomain.com",
    "mydomain.com",
  ]

  # alias = {
  #   names = [
  #     "d130easdflja734js.cloudfront.net"
  #   ]
  #   zone_ids = [
  #     "Z2FDRFHATA1ER4"
  #   ]
  #   evaluate_target_healths = [
  #     false
  #   ]
  # }
}

module "s3_bucket" {
  source      = "./modules/s3"
  name        = var.bucket_name
  application = var.project
  environment = var.environment
  #versioning                        = true
  #acl                               = "private"
  bucket_logging_encryption_enabled = true
  sse_algorithm                     = var.sse
  target_bucket                     = var.log_bucket
  target_prefix                     = var.log_prefix
}

module "cloudfront" {
  source = "./modules/cloudfront"

  name                = var.name
  root_domain         = var.domain
  subdomains          = var.subdomains
  acm_certificate_arn = var.acm_certificate_arn
  allowlist_ipv4      = var.allowlist_ipv4
  allowlist_ipv6      = var.allowlist_ipv6

  default_origin = {
    domain_name = module.s3_bucket.bucket_regional_domain_name
    #"protected-cloudfront-demo-app.s3-website-eu-west-1.amazonaws.com"
    origin_path = ""
    custom_origin_config = {
      http_port                = 80
      https_port               = 443
      origin_read_timeout      = 60
      origin_keepalive_timeout = 10
      origin_ssl_protocols     = ["TLSv1.2"]
      origin_protocol_policy   = "http-only"
      # WARNING: Traffic should be secured between cloudfront and origins
      # S3 website hosting is always unsecured HTTP 
    }
  }
  forwarded_headers = ["Authorization", "Referrer"]
  static_path       = "/static"
}
