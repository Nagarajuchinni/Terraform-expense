resource "aws_instance" "Frontend" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_id
    tags = {
      Name = "Frontend"
    }
  
}

resource "aws_route53_record" "Frontend" {
  zone_id = var.zone_id
  name    = "Frontend-${var.env}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.Frontend.private_ip]
}

resource "aws_instance" "Backend" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_id
    tags = {
      Name = "Backend"
    }
  
}

resource "aws_route53_record" "Backend" {
  zone_id = var.zone_id
  name    = "Backend-${var.env}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.Backend.private_ip]
}

resource "aws_instance" "mysql" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_id
    tags = {
      Name = "mysql"
    }
  
}

resource "aws_route53_record" "mysql" {
  zone_id = var.zone_id
  name    = "Mysql-${var.env}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

