resource "aws_security_group" "websg" {
  name_prefix = var.mysg_name
  vpc_id      = var.custom_vpc_id


  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.mysgingress_cidr_block]
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.mysgingress_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.aws_security_group
  }
}

resource "aws_lb" "myalb" {
  name               = var.myalb-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.websg.id]
  subnets            = [var.subnet1_id, var.subnet2_id]
}

resource "aws_lb_target_group" "myalb_target_group" {
  name     = var.my-alb-target-group
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.custom_vpc_id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "myalb_target_group_attachment1" {
  target_group_arn = aws_lb_target_group.myalb_target_group.arn
  target_id        = var.webserver1_publicIP
  port             = 80
}

resource "aws_lb_target_group_attachment" "myalb_target_group_attachment2" {
  target_group_arn = aws_lb_target_group.myalb_target_group.arn
  target_id        = var.webserver2_publicIP
  port             = 80
}

resource "aws_lb_listener" "myalb_listener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.myalb_target_group.arn
    type             = "forward"
  }
}