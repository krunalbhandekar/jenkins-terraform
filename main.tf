module "jenkins_terraform" {
  source = "./module"

  aws_region    = "ap-south-1"
  agent_count   = 2
  os_type       = "ubuntu" # "ubuntu or amazon-linux"
  instance_type = "t2.micro"
}

output "print_ami_id" {
  description = "AMI ID"
  value       = module.jenkins_terraform.ami_id
}

output "print_jenkins_master_public_ip" {
  description = "Public IP of Jenkins master instances"
  value       = module.jenkins_terraform.jenkins_master_public_ip
}

output "print_jenkins_agent_public_ips" {
  description = "Public IPs of all Jenkins agent instances"
  value       = module.jenkins_terraform.jenkins_agent_public_ips
}
