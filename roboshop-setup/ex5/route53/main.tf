
resource "aws_route53_record" "record" {
  zone_id = "Z069905439T4JHL9YIZCX"
  name    = "${var.component}-dev.devopscourse.online.com"
  type    = "A"
  ttl     = 300
  records = [var.private_ip]
}

variable "private_ip" {}
variable "component" {}
