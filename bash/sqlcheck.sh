#!/bin/bash
until nc -z -v -w30 172.16.238.12 3306
do
	echo "Waiting for db..."
	sleep 3
done
mysql -h mysql -u root -ppass -e 'CREATE DATABASE my_wp;'
wp @production db export - | wp db import - && wp search-replace '//wordpress-852642-2977214.cloudwaysapps.com' '//rorlocal.loc'
