
locals {
  common_tags = {
    Name = "jjtech"
    App_Name = "ovid"
    Cost_center = "xyz222"
    Business_unit = "GBS"
    Project = "GBS"
    App_role = "web server"
    Customer = "students"
    Environment = "dev"
    Confidentiality = "Restricted"
    Owner = "jespo_mbwoge@jjtechinc.co"
    Opt_in-Opt_out = "Yes"
    Application_ID = "197702"
    Compliance = "pci"

  }
}

resource "aws_instance" "jjtechweb" {
  ami = var.ami_id["rhel"]
  instance_type = var.instance_type[0]

  tags = local.common_tags

}
resource "aws_instance" "jjtechweb01" {
  ami = var.ami_id["linux"]
  instance_type = var.instance_type[1]

  tags = local.common_tags
}
resource "aws_instance" "jjtechweb02" {
  ami = var.ami_id["ubuntu"]
  instance_type = var.instance_type[2]

  tags = local.common_tags

}
resource "aws_ebs_volume" "jjtechEbs1" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = local.common_tags
}

output "jjtechec2" {
  value = aws_instance.jjtechweb.public_ip
}

resource "aws_eip" "iriseip" {
  vpc      = true
}

output "jjtecheip" {
  value = aws_eip.iriseip.id
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.jjtechweb.id
  allocation_id = aws_eip.iriseip.id
}
