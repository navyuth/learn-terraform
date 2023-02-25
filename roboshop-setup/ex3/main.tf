data "aws_ami" "ami" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = [973714476881]
}

resource "aws_instance" "frontend" {
  for_each = var.instances
  ami = data.aws_ami.ami.image_id
  instance_type = each.value["type"]
  vpc_security_group_ids = ["sg-0141873d0ab9c8b98"]
  tags = {
    Name=each.value["name"]
  }
}

variable "instances" {
  default = {
    Catalogue = {
      name = "Catalogue"
      type = "t3.micro"
    }
    User = {
      name = "User"
      type = "t3.small"
    }
  }
}
