# ALB Security Group
resource "aws_security_group" "alb_sg" {
  vpc_id      = aws_vpc.main_vpc.id
  description = "allow all traffic"
 
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port   = 0            
    to_port     = 0            
    protocol    = "-1"         
    cidr_blocks = ["0.0.0.0/0"] 
  } 
 }

# ALB
resource "aws_lb" "my_alb" {
  name               = "${var.tags["name"]}-alb"
  internal           = false                     # assign ALB Internet-facing
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [
    aws_subnet.public_subnet_1.id, 
    aws_subnet.public_subnet_2.id, 
    aws_subnet.public_subnet_3.id
  ]  
  tags = {
    Name = "${var.tags["name"]}-ALB-1"
  }
}

# ALB listener
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_TG.arn
  }
  tags = {
    Name = "${var.tags["name"]}-listener-1"
  }
}

