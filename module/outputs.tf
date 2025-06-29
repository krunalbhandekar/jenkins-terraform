output "ami_id" {
  description = "AMI ID"
  value       = data.aws_ami.machine.id
}

output "jenkins_master_public_ip" {
  description = "Public IP of Jenkins master instances"
  value       = aws_instance.jenkins_master.public_ip
}


output "jenkins_agent_public_ips" {
  description = "Public IPs of all Jenkins agent instances"
  value = {
    for index, instance in aws_instance.jenkins_agent :
    var.agents[index].name => instance.public_ip
  }
}

