resource "aws_route53_zone" "this" {
  count = "${var.zone_id == "false" ? 1 : 0}"
  name  = "${var.zone_name}"
}

resource "aws_route53_record" "www" {
  count   = "${var.zone_id == "false" && length(var.records["names"]) > 0 ? length(var.records["names"]) : 0}"
  zone_id = "${var.zone_id != "false" ? var.zone_id : aws_route53_zone.this.0.zone_id}"
  name    = "${element(var.records["names"], count.index)}${var.zone_name}"
  type    = "${element(var.records["types"], count.index)}"
  ttl     = "${element(var.records["ttls"], count.index)}"
  records = "${split(",", element(var.records["values"], count.index))}"
}