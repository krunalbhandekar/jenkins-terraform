data "aws_ami" "machine" {
  most_recent = true
  owners      = local.img_owners

  filter {
    name   = "name"
    values = local.img_names
  }
}
