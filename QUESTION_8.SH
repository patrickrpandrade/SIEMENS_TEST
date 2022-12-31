#!/bin/bash
file="$1"
while read line; do
	server=$line
	server_version=$(ssh myuser@server 'uname-a')
	ip_server=$(dig 'server +short')
	now=$(date +'%T %D')
	out="$now $server $ip_server $server_version"
	echo "out" >> servers_version.txt	
done < "file"
	
