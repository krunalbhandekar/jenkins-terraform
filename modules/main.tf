provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "jenkins_master" {
  ami                    = data.aws_ami.machine.id
  key_name               = aws_key_pair.jenkins_key.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  user_data = file("${path.module}/scripts/${var.os_type}/jenkins_master.sh")

  tags = {
    Name = "jenkins-master"
  }
}

resource "aws_instance" "jenkins_agent" {
  count                  = var.agent_count
  ami                    = data.aws_ami.machine.id
  key_name               = aws_key_pair.jenkins_key.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  user_data = file("${path.module}/scripts/${var.os_type}/jenkins_agent.sh")

  tags = {
    Name = "terraform-agent-${count.index + 1}"
  }
}
