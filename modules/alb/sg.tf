resource "aws_security_group" "alb_security_group" {
  name        = "PSP-PRD-ALB-CORE-SG"
  description = "Core ALB Security Group"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 7090
    to_port     = 7090
    protocol    = "tcp"
    cidr_blocks = ["10.184.20.119/32", "10.184.20.154/32"] //Faltan los SG bastion, portal, core ec2
  }
  ingress {
    from_port   = 7191
    to_port     = 7191
    protocol    = "tcp"
    cidr_blocks = ["10.184.20.154/32", "10.184.20.119/32"] //Faltan los SG bastion, portal, core ec2
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    #tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "PSP-PRD-ALB-CORE-SG"
    /*Project     = "${var.project}"
    Environment = "${var.environment}"*/
  }
}

resource "aws_security_group" "ihs_security_group" {
  name        = "PSP-PRD-ALB-IHS-SG"
  description = "IHS ALB Security Group"
  vpc_id      = var.vpc_id
  ingress {
    from_port = 4446
    to_port   = 4446
    protocol  = "tcp"
    #tfsec:ignore:AWS008
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 4445
    to_port   = 4445
    protocol  = "tcp"
    #tfsec:ignore:AWS008
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 4444
    to_port   = 4444
    protocol  = "tcp"
    #tfsec:ignore:AWS008
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 4443
    to_port   = 4443
    protocol  = "tcp"
    #tfsec:ignore:AWS008
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    #tfsec:ignore:AWS008
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    #tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "PSP-PRD-ALB-IHS-SG"
    /*Project     = "${var.project}"
    Environment = "${var.environment}"*/
  }
}