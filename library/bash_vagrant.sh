#!/bin/bash
#[ -f "$1" ] && source $1

source $1

if ! [ "$path" ]
then echo '{"failed": true, "msg": "Missing required argument path=path/to/Vagrantfile"}'
exit 1
fi

if ! [ "$state" ]
then echo '{"failed": true, "msg": "Missing required argument state=start/stop/destroy/status"}'
exit 1
fi

if ! [ -f "$path" ]
then printf '{"failed": true, "msg": "%s doesnt exists"}' "$path"
exit 1
fi

function status {
changed="true"
vagrant destroy -f
output=$(vagrant status | awk '/virtualbox/{print $2, $3}')
}

function status {
changed="false"
output=$(vagrant status | awk '/virtualbox/{print $2, $3}')
}

function stop {
if [ "$(vagrant status | awk '/virtualbox/{print $2}')" = running ]
then 
changed="true"
vagrant halt
output=$(vagrant status | awk '/virtualbox/{print $2}')
else 
changed="false"
output="VM is not running"
fi
}


function start {
if [ "$(vagrant status | awk '/virtualbox/{print $2}')" = running ]
then
changed="false"
output="VM is running"
else 
changed="true"
vagrant up
output=$(vagrant status | awk '/virtualbox/{print $2}')
fi
}

os_name=$(cat "$path" | awk '/vm.box/{print $3}')
os_memory=$(cat "$path" | awk '/memory/{print $3}')
ssh_key=$(cat "$path" | awk '/ssh/{print $3}')
ipaddr=$(cat "$path" | awk '/network/{print $6}')
username=$(cat "$path" | awk '/define/{print $2}')

case $state in
start) start;;
stop) stop;;
status) status;;
destroy) destroy;;
*) echo '{"failed": true, "msg": "state can be status|start|stop|destroy"}'
exit 1;;
esac

cat << EOF
{
	"changed": $changed,
	"time": "$(date +'%Y-%m-%d %T')",
	"path": "$path",
	"os_name": $os_name,
	"os_memory": $os_memory,
	"ssh_key": "$ssh_key",
	"ip_address": $ipaddr,
	"username": $username,
	"output": "$output"
}
EOF
