variable "aws_region" {
  type = string
}


variable "agents" {
  description = "List of agent configurations"
  type = list(object({
    name          = string
    instance_type = string
  }))
}


variable "os_type" {
  type = string
}

variable "master_instance_type" {
  type = string
}


