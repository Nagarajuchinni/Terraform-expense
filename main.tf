resource "aws_instance" "instances" {
    for_each = var.components
    ami = var.ami
    instance_type = each.value["instance_type"]
    vpc_security_group_ids = var.sg_id
    tags = {
      Name = "${each.value["name"]}-${var.env}"
    }
  
}

output "instances" {
  value = aws_instance.instances
}

# resource "aws_route53_record" "Frontend" {
#   for_each = var.components
#   zone_id = var.zone_id
#   name    = "${each.value["name"]}-${var.env}"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.instances[each.name["name"]].private_ip]
# }

# resource "aws_instance" "Backend" {
#     ami = var.ami
#     instance_type = var.instance_type
#     vpc_security_group_ids = var.sg_id
#     tags = {
#       Name = "Backend"
#     }
  
# }

# resource "aws_route53_record" "Backend" {
#   zone_id = var.zone_id
#   name    = "Backend-${var.env}"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.Backend.private_ip]
# }

# resource "aws_instance" "mysql" {
#     ami = var.ami
#     instance_type = var.instance_type
#     vpc_security_group_ids = var.sg_id
#     tags = {
#       Name = "mysql"
#     }
  
# }

# resource "aws_route53_record" "mysql" {
#   zone_id = var.zone_id
#   name    = "Mysql-${var.env}"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.mysql.private_ip]
# }