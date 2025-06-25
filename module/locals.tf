locals {
  img_owners = (var.os_type == "ubuntu" ? ["099720109477"] :
    var.os_type == "amazon-linux" ? ["137112412989"] : []
  )
  img_names = (var.os_type == "ubuntu" ? ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"] :
  var.os_type == "amazon-linux" ? ["amzn2-ami-hvm-*-x86_64-gp2"] : [])
}
