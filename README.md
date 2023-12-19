# Using Terraform and Ansible to set up apache server on a VM

Here I used:

Terraform
- To generate a VM from a template, using the clone setting 
- Terraform files (.tf) were written in HCL (HashiCorp Configuration Language)
- My main.tf file made use of provider, resource and data blocks to generate the VM
- I also used variable files separate to the main.tf to pull in this data 
- I also used the local_file resource to write my newly created VMs IP to an inventory file in an ansible directory, to allow the playbook to direct to the right host
- I used the local-exec provisioner to execute ansible from the command line using terraform

Ansible
- To configure my VM to run an apache server, using an inventory file written by terraform

What I learned:
- The difference in Ansible and Terraform - Terraform mainly behaving as an infrastructure provisioning tool and Ansible as a configuration and app deployment tool
- How to use terraform with some basic commands and methodologies  