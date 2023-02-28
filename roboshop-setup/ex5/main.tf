module "sg" {
  source = "./sg"
}

module "ec2" {
  source = "./ec2"
  for_each = var.instances
  component = each.value["name"]
  instance_type = each.value["type"]
  sg_id = module.sg.sg_id
}

output "ec2" {
  value = module.ec2
}