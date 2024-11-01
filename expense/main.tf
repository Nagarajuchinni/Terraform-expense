module "expense" {
  for_each = var.components
  source = "./module"

  ami = var.ami
  env = var.env
  instance_type = each.value["instance_type"]
  zone_id = var.zone_id
  name = each.value["name"]
  sg_id = var.sg_id


}