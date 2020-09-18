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

# s3 module configuration. This module will create a bucket.
module "s3" {
  source = "./modules/s3"

  create = true
  name   = var.bucket_name
}