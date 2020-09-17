output "zone_id" {
  value = "${element(compact(concat(list(var.zone_id), aws_route53_zone.this.*.id)), 0)}"
}
