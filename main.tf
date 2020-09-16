# Route53 module configuration. This module will create the necessary DNS records.
module "r53_mydomain" {
  source = "./modules/route53"

  description = "DNS records zone for My Domain (mydomain.com)"
  zone_name   = "mydomain.com"
  records = {
    names = [
      "www.",
    ]
    types = [
      "CNAME",
    ]
    ttls = [
      "3600",
    ]
    values = [
      "mydomain.com",
    ]
  }

  # alias = {
  #   names = [
  #     ""
  #   ]
  #   values = [
  #     "d130easdflja734js.cloudfront.net"
  #   ]
  #   zones_id = [
  #     "Z2FDRFHATA1ER4"
  #   ]
  # }
}