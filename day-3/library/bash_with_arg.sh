#!/bin/bash
#[ -f "$1" ] && source $1

source $1

if ! [ "$msg" ]
then echo '{"failed": true, "msg": "Missing required argument"}'
exit 1
fi

if ! [ "$path" ]
then echo '{"failed": true, "path": "Missing required argument"}'
exit 1
fi

cat << EOF
{
	"changed": true,
	"time": "$(date +'%Y-%m-%d %T')",
	"msg": "$msg",
	"path": "$path"
}
EOF
