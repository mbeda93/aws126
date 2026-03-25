resource "aws_instance" "xpix_app" {
  ami                         = var.ami_id
  associate_public_ip_address = true
  availability_zone           = "us-east-1b"
  iam_instance_profile        = var.instance_profile_name
  instance_type               = "t2.micro"
  key_name                    = "xpix-ssh"
  subnet_id                   = aws_subnet.public2.id
  vpc_security_group_ids      = [aws_security_group.xpix_app.id]
  user_data                   = file("${path.module}/user_data.sh")

  tags = { Name = "xpixpleaswork" }
}

output "xpix_public_ip" {
  description = "Public IP of the XPix app server"
  value       = aws_instance.xpix_app.public_ip
}

import {
  to = aws_instance.xpix_app
  id = "i-0cb02648d8c5b3e85"
}
