data "aws_route53_zone" "ipa" {
  name  = "${var.domain}"
}
resource "aws_route53_record" "ipa" {
  zone_id = "${data.aws_route53_zone.ipa.zone_id}"
  name    = "${var.name}.${var.domain}."
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.ipa.public_ip}"]
}
