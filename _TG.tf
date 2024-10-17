resource "aws_lb_target_group" "my_TG" {
  name     = "${var.tags["name"]}-TG1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }

  tags = {
    Name = "${var.tags["name"]}-TG1"
  }
}

resource "aws_lb_target_group_attachment" "public_ec2_1" {
  target_group_arn = aws_lb_target_group.my_TG.arn
  target_id        = aws_instance.public_ec2_1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "public_ec2_2" {
  target_group_arn = aws_lb_target_group.my_TG.arn
  target_id        = aws_instance.public_ec2_2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "public_ec2_3" {
  target_group_arn = aws_lb_target_group.my_TG.arn
  target_id        = aws_instance.public_ec2_3.id
  port             = 80
}
