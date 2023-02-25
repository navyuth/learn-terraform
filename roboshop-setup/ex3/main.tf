data "aws_ami" "ami" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = [973714476881]
}

# Good Mature code
resource "aws_instance" "instances" {
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

output "ec2" {
  value = [for k, v in aws_instance.instances: v.public_ip ]
}

## Immature code
#variable "names" {
#  default = ["Catalogue", "User"]
#}
#
#variable "types" {
#  default = ["t3.micro", "t3.small"]
#}
#
#resource "aws_instance" "instances" {
#  count = length(var.names)
#  ami = data.aws_ami.ami.image_id
#  instance_type = var.types[count.index]
#  vpc_security_group_ids = ["sg-0141873d0ab9c8b98"]
#  tags = {
#    Name = var.names[count.index]
#  }
#}

## Little mature code
#variable "demo" {
#  default = [
#    {
#      name="catalogue"
#      type="t3.micro"
#    },
#    {
#      name="User"
#      type="t3.small"
#    }
#  ]
#}
#
#resource "aws_instance" "instances" {
#  count = length(var.demo)
#  ami = data.aws_ami.ami.image_id
#  instance_type = var.demo[count.index]["type"]
#  vpc_security_group_ids = ["sg-0141873d0ab9c8b98"]
#  tags = {
#    Name=var.demo[count.index]["name"]
#  }
#}