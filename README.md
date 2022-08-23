# Terraform Scripts
This repository contains the scripts required to automate the creation and deletion of virtual machines from pre-defined templates.

In this case we are using an open source program called Terraform by Hashicorp to deploy automate the scaling of the virtual machines. The virual machine template we are using for this example is based on the Ubuntu Server 20.04 Focal image but works the same for any other template based on another image.

## Outline
There are 3 files, namely: ```credentials.auto.tfvars, provider.tf and srv_demo1.tf```.

1. ```credentials.auto.tfvars:```
This file contains the api_token_id and api_token_secret created by the user in Proxmox. A guide on how to create these can be found here:

2. ```provider.tf:```
This file contains the proxmox provider configurations. 
*NOTE:* The Telmate/proxmox provider is not an official provider by Terraform but it is actively maintained by a community of users.

3. ```srv_demo1.tf:```
This file contains the actual specifications (CPU, Memory, Storage, Network) of the virtual machine we want to create, from which template we should create it.

## How to use
1. Clone this Github repository. ```git clone https://github.com/Group-BSE22-8/terraform-scripts.git```
2. Download and install Terraform. You can find the download link for your operating system [Here](https://www.terraform.io/downloads)
3. Change directory to the terraform-scripts folder. ```cd terraform-scripts```
4. Run ```terraform init``` in the cloned directory.
5. Set the ```proxmox_api_url```, ```proxmox_api_token_id``` and the ```proxmox_api_token_secret``` in the ```credentials.auto.tfvars``` file. 
*NOTE:* Make sure you never upload this file as it contains sensitive information.
6. Change the specifications of the virtual machine to be created in the ```srv_demo1.tf``` file. You especially want to to take note of the name, vmid, target_node and clone. The name and vmid should not be the same as that of a virtual machine that already exists. The target_node is the one under which you want the virtual machine to be deployed. The full list of variables that can be configured can be found [Here](https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/guides/cloud_init.md). Documentation on how to use the Telmate/Proxmox provider in general can also be found [Here](https://github.com/Telmate/terraform-provider-proxmox/tree/master/docs).

7. Run  ```terraform plan``` to see the changes that will be made to the node you selected.
8. If you are happy with the changes about to be made, run ```terraform apply``` to provision the virtual machine.

## Known issues
1. Upon running the script, the virtual machine will be created but an error showing "The VM is locked" will be displayed. This is not an issue, you simply have to start up the virtual machine.
