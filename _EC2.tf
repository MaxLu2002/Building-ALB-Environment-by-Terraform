resource "aws_security_group" "public_sg" {
  vpc_id      = aws_vpc.main_vpc.id
  description = "Allow SSH and HTTP"
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0            
    to_port     = 0            
    protocol    = "-1"         
    cidr_blocks = ["0.0.0.0/0"] 
  }

  tags = {
    Name = "${var.tags["name"]}-public-sg"
  }
}

# public EC2-1
resource "aws_instance" "public_ec2_1" {
  ami                    = var.EC2_AMI.x86ID  
  instance_type          = var.EC2_size.t3micro
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.public_sg.id] 
  iam_instance_profile   = aws_iam_instance_profile.ec2_admin_instance_profile.name
  user_data = file("${path.module}/userdata_1.sh")
  tags = {
    Name = "${var.tags["name"]}-Pub-ec2-1"
  }
}

# public EC2-2
resource "aws_instance" "public_ec2_2" {
  ami                  = var.EC2_AMI.x86ID  
  instance_type        = var.EC2_size.t3micro
  subnet_id            = aws_subnet.public_subnet_2.id
  vpc_security_group_ids = [aws_security_group.public_sg.id]  
  iam_instance_profile = aws_iam_instance_profile.ec2_admin_instance_profile.name
  user_data = file("${path.module}/userdata_2.sh")
  tags = {
    Name = "${var.tags["name"]}-Pub-ec2-2"
  }
}

# public EC2-3
resource "aws_instance" "public_ec2_3" {
  ami                  = var.EC2_AMI.x86ID  
  instance_type        = var.EC2_size.t3micro
  subnet_id            = aws_subnet.public_subnet_3.id
  vpc_security_group_ids = [aws_security_group.public_sg.id]  
  iam_instance_profile = aws_iam_instance_profile.ec2_admin_instance_profile.name
  associate_public_ip_address = true
  user_data = file("${path.module}/userdata_3.sh")
  tags = {
    Name = "${var.tags["name"]}-Pub-ec2-3"
  }
}