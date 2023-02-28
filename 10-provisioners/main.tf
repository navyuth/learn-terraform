resource "aws_instance" "ec2" {
  ami = "ami-0a017d8ceb274537d"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0141873d0ab9c8b98"]
  tags = {
    Name = "Terraform Test1"
  }

  provisioner "remote-exec" {

    connection {
      host = self.public_ip
      user = "root"
      password = "DevOps321"
    }

    # Inline will execute list of commands
    inline = [
      "echo Hello World"
    ]
  }
}
