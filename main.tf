resource "aws_instance" "public" {
  ami                         = "${var.ami}" # find the AMI ID of Amazon Linux 2023  
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.subnet_id}"  #Public Subnet ID, e.g. subnet-xxxxxxxxxxx
  associate_public_ip_address = true
  key_name                    = "saw-keypair" #Change to your keyname, e.g. jazeel-key-pair
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  count = 1
 
  tags = {
    Name = "${var.name}-ec2-${count.index}"    #Prefix your own name, e.g. jazeel-ec2
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "saw-terraform-security-group" #Security group name, e.g. jazeel-terraform-security-group
  description = "Allow SSH inbound"

  vpc_id      = "${var.vpc_ID}"  #VPC ID (Same VPC as your EC2 subnet above), E.g. vpc-xxxxxxx
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"  
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

variable "name" {
   type = string
   description = "name of app"
   default = "saw-app"
}





