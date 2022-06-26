provider "aws" {
    access_key = ""

    secret_key = ""

    region     = "eu-central-1"
}

data "aws_ami" "data_ubuntu" {
    most_recent = true
    owners = ["099720109477"] 
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }    
}


data "aws_ami" "data_amz" {
    most_recent = true
    owners = ["137112412989"] 
    filter {
        name   = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220606.1-x86_64-gp2"]
    }  
}

resource "aws_vpc" "vpc_task3" {
  cidr_block = "10.0.0.0/21"
  tags = {
    name = "vpc_task3"
    project = "task3"    
    }
}

resource "aws_subnet" "sub_vpc_task3" {
  vpc_id     = aws_vpc.vpc_task3.id
  cidr_block = "10.0.0.0/26"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-central-1a"
   tags = {
    Name = "sub1_vpc_task3"
    project = "task3"
    }
}

resource "aws_internet_gateway" "task3_gw" {
  vpc_id = aws_vpc.vpc_task3.id
  tags = {
    Name = "task3_gw"
    }
}

resource "aws_route_table" "task3_rout" {
  vpc_id = aws_vpc.vpc_task3.id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.task3_gw.id
    }
}

resource "aws_route_table_association" "task3_rt_association" {
    subnet_id = aws_subnet.sub_vpc_task3.id
    route_table_id = aws_route_table.task3_rout.id
    }

resource "aws_security_group" "task3_vpc_public_sec_group" {
  name = "task3_vps_sec_group"
  vpc_id = aws_vpc.vpc_task3.id
  tags = {
    project = "task3"
    }
}

resource "aws_security_group_rule" "public_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 
  security_group_id = aws_security_group.task3_vpc_public_sec_group.id
}
 
resource "aws_security_group_rule" "public_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.task3_vpc_public_sec_group.id
}
 
resource "aws_security_group_rule" "public_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.task3_vpc_public_sec_group.id
}
 
resource "aws_security_group_rule" "public_in_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.task3_vpc_public_sec_group.id
}

resource "aws_security_group_rule" "public_in_icmp" {
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.task3_vpc_public_sec_group.id
}

resource "aws_instance" "ubuntu_task3" {
    ami = data.aws_ami.data_ubuntu.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.sub_vpc_task3.id
    vpc_security_group_ids = [ aws_security_group.task3_vpc_public_sec_group.id ]
    key_name = "Francfurt"
    tags = {
    name = "ubuntu_task3"
    project = "task3"
    }
    user_data              = <<EOF
#!/bin/sh

. /etc/os-release

CONTENT="<html><H1>Hey, Dude</H1><p>Linux ip-10-0-0-11 5.15.0-1011-aws #14-Ubuntu SMP Wed Jun 1 20:54:22 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux</p><table clas>"

if [ $ID = "centos" ]
then 
yum update -y
yum install -y nginx
service nginx start 
echo
echo $CONTENT > /usr/share/nginx/html/index.html
elif [ $ID = "ubuntu" ] || [ $ID = "debian" ]
then
apt update -y
apt install -y nginx
service nginx start 
echo $CONTENT > /var/www/html/index.html
elif [ $ID = "amzn" ]
then
yum update -y
amazon-linux-extras install nginx1 -y
service nginx start 
echo $CONTENT > /usr/share/nginx/html/index.html        
else 
echo "you have not supported distribution"
fi

curl -fsSL https://test.docker.com -o test-docker.sh
sudo sh test-docker.sh
sudo apt-get install -y docker-ce=5:20.10.17~3-0~ubuntu-jammy docker-ce-cli=5:20.10.17~3-0~ubuntu-jammy containerd.io docker-compose-plugin
  EOF
}

resource "aws_instance" "amz_task3" {
    ami = data.aws_ami.data_amz.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.sub_vpc_task3.id
    associate_public_ip_address= "false"
    key_name = "Francfurt"
    vpc_security_group_ids = [ aws_security_group.task3_vpc_public_sec_group.id ]
    tags = {
    name = "amz_task3"
    project = "task3"
    }
}


