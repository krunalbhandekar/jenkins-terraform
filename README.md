# 🧩 Jenkins Master-Agent Setup on AWS using Terraform

This project allows you to **provision a Jenkins master instance and multiple Jenkins agent (node) instances** on AWS using Terraform. Jenkins will be pre-installed and pre-unlocked automatically using `user_data`.

---

## 🚀 Features

- Jenkins master EC2 instance on Ubuntu or Amazon Linux
- Multiple Jenkins agent EC2 instances (configurable)
- Automatically install Jenkins and Java
- Fully automated provisioning via Terraform
- Outputs Jenkins master and agent public IPs

---

## 🛠️ Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform installed
- A valid SSH key pair at `~/.ssh/id_rsa.pub` for EC2 access

---

## 📦 Project Structure

```bash
├── main.tf # Root Terraform config
├── module/ # Reusable Jenkins infrastructure module/
    ├── data.tf
    ├── key-pair.tf
    ├── locals.tf
    ├── main.tf
    ├── outputs.tf
    ├── security-group.tf
    ├── variables.tf
    └── scripts
        ├── ubuntu/
        │   ├── jenkins_master.sh
        │   └── jenkins_agent.sh
        └── amazon-linux/
            ├── jenkins_master.sh
            └── jenkins_agent.sh
```

---

## ⚙️ How to Use

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/krunalbhandekar/jenkins-terraform.git
```

```bash
cd jenkins-terraform
```

### 2️⃣ Edit `main.tf`

Update the following block as per your requirement:

```hcl
module "jenkins_terraform" {
  source        = "./module"
  aws_region    = "ap-south-1"
  agent_count   = 2
  os_type       = "ubuntu" # or "amazon-linux"
  instance_type = "t2.micro"
}
```

### 3️⃣ Initialize and Apply Terraform

```bash
terraform init
```

```bash
terraform apply -auto-approve
```

### ✅ Outputs

After deployment, Terraform will print the following outputs:

```hcl
output "print_ami_id" {
  description = "AMI ID"
  value       = module.jenkins_terraform.ami_id
}

output "print_jenkins_master_public_ip" {
  description = "Public IP of Jenkins master instance"
  value       = module.jenkins_terraform.jenkins_master_public_ip
}

output "print_jenkins_agent_public_ips" {
  description = "Public IPs of all Jenkins agent instances"
  value       = module.jenkins_terraform.jenkins_agent_public_ips
}
```

### 🔗 Access Jenkins

Once the provisioning is complete:

- Copy the **Jenkins master public IP** from the Terraform output.
- Open it in your browser at port `8080`:

```cpp
http://<jenkins_master_public_ip>:8080
```

### 📤 Cleanup

To destroy all AWS resources created:

```bash
terraform destroy
```

---

## 🧠 Notes

- This setup uses the default VPC in the region you specify.
- You can customize AMI IDs, VPC, subnets, and other settings if needed.
- Consider using Elastic IPs or Route53 for a production setup.

---

### 👨‍💻 Author

Maintained by **[Krunal Bhandekar](https://www.linkedin.com/in/krunal-bhandekar/)**

---
