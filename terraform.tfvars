env = "dev"
ami = "ami-0b4f379183e5706b9"
sg_id = ["sg-05c6fc961188560fd"]
zone_id = "Z08026271RHGWGFS6JD44"

components = {
    frontend = {
        name = "frontend"
        instance_type = "t2.micro"
    }
    backend = {
        name = "backend"
        instance_type = "t2.micro"
    }
    mysql = {
        name = "mysql"
        instance_type = "t2.micro"
    }
}