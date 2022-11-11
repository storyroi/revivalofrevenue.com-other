#!/bin/sh

docker-compose exec --user devilbox php cd /shared/httpd/rorlocal && rm -rf * .* ; eval `ssh-agent -s` && ssh-add /etc/bashrc-devilbox.d/.ssh/master && ssh-add /etc/bashrc-devilbox.d/.ssh/gh && git clone git@github.com:storyroi/revivalofrevenue.com-WPComposer.git ; mv /shared/httpd/rorlocal/revivalofrevenue.com-WPComposer/* /shared/httpd/rorlocal/ ; mv /shared/httpd/rorlocal/revivalofrevenue.com-WPComposer/.* /shared/httpd/rorlocal/ ; rmdir revivalofrevenue.com-WPComposer ; cp .env.example .env ; ln -s web/ htdocs ; composer install ; sh /etc/bashrc-devilbox.d/sqlcheck.sh
