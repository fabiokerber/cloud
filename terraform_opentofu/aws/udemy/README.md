# Terraform

## First Steps
```
- Budget
  Cost budget
  Default Budget
  Monthly
  Recurring budget
  Fixed
  25.00
  All AWS services

  80% threshold of budgeted amount (Forecasted)
```
```
- IAM Identity Center > Users (New user)
	fabiokerber

-IAM Identity Center > Groups (New group)
	adm_access

-IAM Identity Center > Permission sets (New permission set)
	AdministratorAccess

-Added "fabiokerber" to "AdministratorAccess"

Root user: fabio.kerber@hotmail.com
Auth: Google Authenticator

AWS access portal URL: https://d-9067f5d2d6.awsapps.com/start
Username: fabiokerber
Auth: Microsoft Authenticator
```

## Cloud9

# Create virtual environment to use AWS through terraform<br>
```
- Create environment
  terraform
  New EC2 instance
  t3.micro
  Ubuntu Server
  30 minutes
```

# Terminal
```
sh cloud9_disk_resize.sh

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

## Terraform

# Apply "plan file" without confirmation
```
terraform plan -out=plan1
terraform apply plan1
```

# tfstate<br>
!!Should be encrypted and secure as much as possible, may be contain very sensitive info!!
```
terraform state list (view all resources)
terraform apply --auto-approve -lock=false (run one command with -lock=false and another without this parameter)
```

# jq (view tfstate data)
```
apt install jq -y
terraform show -json | jq
terraform apply --auto-approve
terraform show -json | jq
```

# terraform console
```
terraform state list
terraform show | grep name

terraform console
  docker_container.nodered_container.name
  docker_container.nodered_container.ip_address (useful with Output for example)
  docker_container.nodered_container.ports[0].external
  join(":", [docker_container.nodered_container.ip_address, docker_container.nodered_container.ports[0].external]) (useful in tf files too)

terraform output (some data can't be show because it didn't run terraform apply yet)
```

# vars
```
variable "ext_port" {}
external = var.ext_port

terraform plan -var ext_port=1880 | export TF_VAR_ext_port=1880 && terraform plan

---


```

## OpenTufo Example<br>
https://github.com/saturnhead/blog-examples/blob/main/opentofu-aks/main.tf

