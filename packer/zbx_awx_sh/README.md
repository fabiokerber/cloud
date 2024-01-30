# Packer no Azure

|Código    |Descrição|
|-------------|-----------|
|`v1`| Arquivo Packer único com todos os dados para criação da imagem
|`v2`| Arquivo Packer único com todos os dados para criação da imagem + Provisioner "Shell local"
|`v3`| Arquivo Packer único com todos os dados para criação da imagem + Provisioner "Shell script" + AWX v20.0.1
|`v4`| Estrutura de arquivos Packer + Provisioner "Shell script" + Ansible
|`v5`| Estrutura de arquivos Packer + Provisioner "Ansible" + AWX (necessário ter ansible instalado na máquina local)
|`v6`| Estrutura de arquivos Packer + Provisioner "Ansible" (tasks > main.yml código simplificado) + AWX (necessário ter ansible instalado na máquina local)

Download Packer<br>
```
https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_windows_amd64.zip
https://releases.hashicorp.com/packer/1.8.0/packer_1.8.0_windows_amd64.zip
```

Checar versão Packer<br>
Obs: Ideal inserir caminho do executável nas variáveis de ambiente<br>
```
C:\packer\packer.exe -version
```

## Configurar permissões no Azure
Anote o ID da Subscription<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221411.png">
</kbd>
<br />
<br />

Agora acesse o *Azure Active Directory*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221412.png">
</kbd>
<br />
<br />

Clique em *App registrations* em seguida *New registration*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221413.png">
</kbd>
<br />
<br />

Preencha os dados e clique em *Register*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221414.png">
</kbd>
<br />
<br />

Após criado o registro, anote o *Application ID*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221415.png">
</kbd>
<br />
<br />

Ainda dentro do registro *packer-lab*, clique em *Certificates & secrets*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221416.png">
</kbd>
<br />
<br />

Clique em *New client secret*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221417.png">
</kbd>
<br />
<br />

Preencha o campo, selecione o tempo de expiração desejado e clique em *Add*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221418.png">
</kbd>
<br />
<br />

Agora anote a chave do secret<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221419.png">
</kbd>
<br />
<br />

Retorne à *Subscription* e clique em *Access control (IAM)*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221432.png">
</kbd>
<br />
<br />

Clique em *Add role assignment*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221433.png">
</kbd>
<br />
<br />

Selecione *Owner* e clique em *Next*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221434.png">
</kbd>
<br />
<br />

Nesta etapa selecione *User, group, or service principal*<br>
Clique em *+ Select members*, digite o nome para localizar e selecionar o *packer-lab*<br>
Clique em *Select* e logo em seguida em *Next*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221435.png">
</kbd>
<br />
<br />

Por fim, clique em *Review + assign*<br>
<kbd>
    <img src="https://github.com/fabiokerber/Packer/blob/main/1.zbx_awx_sh/img/210320221436.png">
</kbd>
<br />
<br />

## Logar no Azure
```
az login
az account show
az account set --subscription "Azure subscription 1" (verificar se está conectado na Subscription correta)
```

## Criar Resource Group e comandos de auxílio
Criar resource group para armazenar as imagens
```
az group create -l brazilsouth -n rg-img-br-sh
```

Listar imagens disponíveis no Azure
```
az vm image list --location brazilsouth --publisher Canonical --offer UbuntuServer --all --output table
az vm image list --location brazilsouth --publisher RedHat --offer RHEL --all --output table
```

## Provisionar (PowerShell)
Obs: https://morgansimonsen.com/2018/03/21/packer-for-azure-peculiarities/<br>
```
az login
az account show
az account set --subscription "Azure subscription 1" (verificar se está na Subscription correta)
C:\packer\packer.exe init .
C:\packer\packer.exe fmt .
C:\packer\packer.exe validate .
C:\packer\packer.exe validate --var-file=values.pkrvars.hcl .
C:\packer\packer.exe build .
C:\packer\packer.exe build --var-file=values.pkrvars.hcl -var "subscription_id=ee6222a2-c6ac-48ae-b6ad-b7fef2589b74" -var "tenant_id=51fd35eb-5f5d-4077-b2cb-6e257ba1a75a" -var "client_id=4b9cf9e2-ba75-48a0-b56d-ba0ab00083af" -var "client_secret=4V67Q~CwjR16jokWxBD--NDHM0h1l~I5TtZ~x" .
```

## Alterar values.tfvars Terraform
```
# Custom image
image_rg   = "rg-img-br-sh"
image_name = "vm-img-20220328154216-awx-br-sh"
image_id   = "/subscriptions/ee6222a2-c6ac-48ae-b6ad-b7fef2589b74/resourceGroups/rg-img-br-sh/providers/Microsoft.Compute/images/vm-img-20220328154216-awx-br-sh"
```

## Instalar Ansible e Packer
Centos 7
```
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum update -y
sudo yum install -y python36 python36-devel packer
sudo pip3 install --upgrade pip && sudo pip3 install --upgrade setuptools
sudo pip3 install setuptools_rust wheel && sudo pip3 install ansible
sudo touch /var/log/ansible.log && sudo chmod 777 /var/log/ansible.log
```

Ubuntu Server
```
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer
sudo touch /var/log/ansible.log && sudo chmod 777 /var/log/ansible.log
```

RHEL 7.8
```
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum update -y
sudo yum install -y packer yum-utils rh-python38-python.x86_64 rh-python38-python-pip.noarch rh-python38-python-devel.x86_64 '@Development Tools' git libselinux-python3.x86_64
sudo pip3.6 install --upgrade pip && sudo pip3.6 install --upgrade setuptools
sudo pip3.6 install setuptools_rust wheel && sudo pip3.6 install ansible
sudo touch /var/log/ansible.log && sudo chmod 777 /var/log/ansible.log
```