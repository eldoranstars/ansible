#!/bin/bash

source $1

if ! [ "$url" ]
then echo '{"failed": true, "msg": "Missing required argument url"}'
exit 1
fi

if ! [ "$username" ]
then echo '{"failed": true, "msg": "Missing required argument username"}'
exit 1
fi

if ! [ "$password" ]
then echo '{"failed": true, "msg": "Missing required argument password"}'
exit 1
fi

if ! [ "$war" ]
then printf '{"failed": true, "msg": "%s doesnt exists"}' "$war"
exit 1
fi

yum install sshpass -y
sshpass -p 'root' scp root@192.168.1.33:"$war" /opt/tomcat/latest/webapps
http_code=$(curl --user "$username":"$password" -s -w "%{http_code}" "$url" | grep ^200)
mkdir -p /var/lib/tomcat/webapps
touch /var/lib/tomcat/webapps/deploy-info.txt
chmod o+w /var/lib/tomcat/webapps/deploy-info.txt
date +'%Y-%m-%d %T'> /var/lib/tomcat/webapps/deploy-info.txt
echo "$username">>/var/lib/tomcat/webapps/deploy-info.txt

cat << EOF
{
	"changed": true,
	"time": "$(date +'%Y-%m-%d %T')",
	"http_code": "$http_code",
	"url": "$url"
}
EOF
