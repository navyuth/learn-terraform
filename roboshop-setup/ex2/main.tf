data "aws_ami" "ami" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = [973714476881]
}

resource "aws_instance" "frontend" {
  count = length(var.instances)
  ami = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0141873d0ab9c8b98"]
  tags = {
    Name=var.instances[count.index]
  }
}

variable "instances" {
  default = ["Catalogue", "cart", "User", "MongoDB", "Shipping"]
}

output "public-ip" {
  value = aws_instance.frontend.*.public_ip
}