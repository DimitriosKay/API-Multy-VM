resource "aws_instance" "ui"{
  ami = "ami-0c30afcb7ab02233d"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.default.id}"
  vpc_security_group_ids = ["${aws_security_group.ui.id}"]
  associate_public_ip_address = true
  private_ip = "10.0.0.23"
  key_name = "default-key-pair"
  provisioner "remote-exec"{
    connection {
      type = "ssh"
      host = "${self.public_ip}"
      user = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
      "sudo apt update",
      "curl https://get.docker.com/ | sudo bash",
      "sudo docker run -d -p 80:80 --name ui hmsbennett/pool_ui:latest"
    ]
  }
  tags = {
    Name = "UI"
  }
}
