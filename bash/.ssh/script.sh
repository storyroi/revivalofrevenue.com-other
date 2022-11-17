#!/bin/bash
cd /shared/httpd/rorlocal
eval `ssh-agent -s`
chmod 600 /etc/bashrc-devilbox.d/.ssh/master
ssh-add /etc/bashrc-devilbox.d/.ssh/master
chmod 600 /etc/bashrc-devilbox.d/.ssh/gh
ssh-add /etc/bashrc-devilbox.d/.ssh/gh
chmod 600 /etc/bashrc-devilbox.d/.ssh/cloudways
ssh-add /etc/bashrc-devilbox.d/.ssh/cloudways
git clone git@github.com:storyroi/revivalofrevenue.com-WPComposer.git
mv /shared/httpd/rorlocal/revivalofrevenue.com-WPComposer/* /shared/httpd/rorlocal/
mv /shared/httpd/rorlocal/revivalofrevenue.com-WPComposer/.* /shared/httpd/rorlocal/
rmdir revivalofrevenue.com-WPComposer
cp .env.example .env
ln -s web/ htdocs
composer install
scp -r master_kutyrbwkyu@45.76.251.5:/home/852642.cloudwaysapps.com/upchssfppx/public_html/web/app/uploads/ web/app/
sh /etc/bashrc-devilbox.d/sqlcheck.sh
