Quick start to Build Static Website in 3 Step using Terraform and Azure
Lets create a simple example to deploy a Static Website using Terraform in Azure, so we need creates Azure Storage Account and enable the static website and deploy it.

Prerequisites:

Azure Account, If you don’t have an Azure subscription, create a free account before you begin.
Configure Terraform: If you haven’t already done so, configure Terraform using one of the following options.
Step 1 – Clone the next repository and open it with Visual Studio Code, modify  terraform.tfvars file with yours variables and settings, if you wanna change the files index.html and error.html to deploy yours static website.


In the outputs.tf file, it will give us the address of the web endpoint,


Step 2 – Open the CLI and start terraform with the next command,


terraform init

Use the command validate to check everything is ok,


terraform validate
Our next step is to execute the plan command,

terraform plan

We continue to apply the terraform.tfstate, with the next command,

terraform apply -auto-approve


Step 3 – Go to the Azure portal and check if everthing is fine, now you can visit the static website that is in the blob storage,


website_index-url = "https://staticwebsitet256.z9.web.core.windows.net/"


Congratulations, this concludes our demo, in the case we don’t need the static website resource anymore we can destroy with the following command:


terraform destroy -auto-approve
