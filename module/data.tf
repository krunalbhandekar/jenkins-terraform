data "http" "my_ip" {
  url = "http://checkip.amazonaws.com/"
}

data "aws_ami" "machine" {
  most_recent = true
  owners      = local.img_owners

  filter {
    name   = "name"
    values = local.img_names
  }
}

data "aws_vpc" "default" {
  default = true
}
