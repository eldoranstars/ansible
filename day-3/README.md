Develop custom filter to select an URL to download MongoDB depends on OS name and Software version from https://www.mongodb.org/dl/linux/
Develop custom module to manage VirtualBox:
Arguments: 
- path to Vagrantfile
- state: started, stopped, destroyed
Return values:
- state: running, stopped, not created
- ip address, port
- path to SSH key file
- username to connect to VM
- os_name
- RAM size
Errors:
- file doesn’t exists
- failed on creation