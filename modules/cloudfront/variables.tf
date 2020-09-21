variable "name" {
  type        = string
  description = "Distribution name"
}
variable "price_class" {
  description = "The price class of the CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}
variable "root_domain" {
  type        = string
  description = "Root domain for Route53 Hosted Zone in FQDN format"
  default     = ""
}
variable "default_origin" {
  description = "The default distribution behaviour"
  type = object({
    domain_name = string
    origin_path = string
    custom_origin_config = object({
      http_port                = number
      https_port               = number
      origin_protocol_policy   = string
      origin_ssl_protocols     = list(string)
      origin_keepalive_timeout = number
      origin_read_timeout      = number
    })
  })

  # Dummy app hosted on S3 website hosting
  default = {
    domain_name = "protected-cloudfront-demo-app.s3-website-eu-west-1.amazonaws.com"
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
}
variable "forwarded_headers" {
  description = "Headers to forward to default origin"
  type        = list(string)
  default     = ["Authorization", "Referrer"]
}
variable "static_path" {
  description = "The root path of the static endpoint"
  type        = string
  default     = "/static"
}
variable "acm_certificate_arn" {
  type        = string
  description = "ACM Certificate ARN for HTTPS"
  default     = "arn:aws:acm:us-east-1:973067341356:certificate/74f34c0f-450d-40c5-9137-58a8d046e909"
}
variable "minimum_tls_version" {
  description = "The minimum TLS version supported for viewers"
  type        = string
  default     = "TLSv1.2_2018"
}
variable "subdomains" {
  type = list(string)
}
variable "allowlist_ipv4" {
  type    = list(string)
  default = []
}
variable "allowlist_ipv6" {
  type    = list(string)
  default = []
}
variable "bucket_regional_domain_name"{
    type    = string
    default = ""
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