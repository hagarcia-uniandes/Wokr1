resource "aws_lb" "albCore" {
  name                       = lower("${var.environment}-${element(var.service_type, 0)}-${element(var.server_service, 1)}-${element(var.resource_type, 0)}")
  internal                   = element(var.alb_internal, 0)
  security_groups            = [aws_security_group.alb_security_group.id]
  subnets                    = var.private_subnet_ids
  enable_deletion_protection = false

  /*tags = merge(var.tags,
    { "Name" = "${var.stack_id}-alb" }
  )*/

  depends_on = [
    aws_security_group.alb_security_group,
  ]

}
resource "aws_lb" "albIHS" {
  name                       = lower("${var.environment}-${element(var.service_type, 0)}-${element(var.server_service, 0)}-${element(var.resource_type, 0)}")
  internal                   = element(var.alb_internal, 1)
  security_groups            = [aws_security_group.ihs_security_group.id]
  subnets                    = var.public_subnet_ids
  enable_deletion_protection = false

  /*tags = merge(var.tags,
    { "Name" = "${var.stack_id}-alb" }
  )*/

  depends_on = [
    aws_security_group.ihs_security_group,
  ]

}