resource "aws_instance" "ec2instance-course" {
  ami                    = "ami-0629230e074c580f2"
  instance_type          = var.instance_type
  user_data              = file("${path.module}/Install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "Course-st4"
  }
}