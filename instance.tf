resource "aws_key_pair" "nginx-key" {
  key_name   = "nginxkey"
  public_key = file("dovekey.pub")
}
resource "aws_instance" "nginx-inst" {
  ami                    = var.ami[var.region]
  instance_type          = "t2.micro"
  subnet_id = aws_subnet.nginx-pub-1.id
  availability_zone      = var.zone1
  key_name               = aws_key_pair.nginx-key.key_name
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  tags = {
    Name = "terraform-nginx-instance"
  }
   connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("dovekey")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}


resource "aws_eip" "ip" {
  vpc = true
  instance = aws_instance.nginx-inst.id
}  
  output "PublicIP" {
  value = aws_instance.nginx-inst.public_ip
  }
  output "PrivateIP" {
  value = aws_instance.nginx-inst.private_ip
  }


  