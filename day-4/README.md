Build command: 
```bash
$ mvn clean package -DbuildNumber=$VERSION
```

Develop a playbook (name: deploy.yml) to deploy war file (role!), pass war-file as an extra-argument to playbook.

Develop custom callback plugin to make playbook output more human readable.