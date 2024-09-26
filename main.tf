resource "aws_security_group" "main"{
    name = local.sg_final_name
    description = "Allow inbound traffic on port 22"
    vpc_id = var.vpc_id 

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"  
        cidr_blocks = ["0.0.0.0/0"]
    }

# we not giving ingress rules, becoz it gets changed time to time
# firewalls may change depending on the project  
    tags = merge(
        var.common_tags,
        var.sg_tags, 
        {
            Name = local.sg_final_name   # expence-dev-mysql
        }
     )
}