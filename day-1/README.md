## Create Ansible inventory file (name: inventory) with remote host connection details.
## Test Ansible connectivity to the VM with ad-hoc command: 
```bash 
$ ansible VM-name -i inventory -m setup
```
## Develop a playbook (name: tomcat_provision.yml) which is supposed to run against any host (specified in inventory).
## Ensure Tomcat is up and running properly with module “shell” (at least 3 different checks).