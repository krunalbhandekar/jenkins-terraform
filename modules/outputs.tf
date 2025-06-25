output "ami_id" {
  description = "AMI ID"
  value       = data.aws_ami.machine.id
}

output "jenkins_master_public_ip" {
  description = "Public IP of Jenkins master instances"
  value       = aws_instance.terraform_master.public_ip
}

output "jenkins_agent_public_ips" {
  description = "Public IPs of all Jenkins agent instances"
  value       = [for agent in aws_instance.terraform_agent : agent.public_ip]
}

