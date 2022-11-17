REVREV DEV WORKFLOW

pre-launch
1. We will use the current cloudways Wordpress as a live, collaborative staging environment that you can add posts to, modify values, etc.
2. Adding plugins, custom files, etc should be done through the main github branch, where it will deploy on Cloudways. Testing new plugins, themes, etc, is best done on the local environment before pushing to staging. Scott T can train further on this.
3. When the staging site is complete and ready to be moved to live, we will clone it as 0.1.0 and move it to live, with the clone becoming the new staging environment
4. Create a staging branch on github that the new staging site is deployed on.

post-launch
5. Configure WPMerge on the new live and new staging site - this will handle DB merging issues.
6. Use the new staging site as a collaborative live environment to add posts, configure settings, etc.
7. Adding plugins, custom files, etc to be tested on the staging site should be done through the staging branch.
8. When changes are signed off on the staging site, the main github branch will be updated, and the WPMerge process initiated.
9. Backups made before any DB transfer or site update happens, along with daily backups.

##SETUP##
This will allow you to clone and run the latest staging environment on your local dev environment to enable rapid plugin and theme development in conjunction with local react development.

If you want to be able to add plugins, themes, etc, you'll have to set this up on your machine.

A few prereqs-

1.) Install Docker
2.) Install Git
3.) If on windows, install WSL
4.) Install Visual Studio Code
5.) create and connect a github ssh key as filename 'gh' in directory '/bash/.ssh/'
6.) Rename env-example to .env in the root folder

Dev Steps

1.) download and extract this repo, open a terminal/powershell window and change directory to the directory where you extracted
2a.) On windows, execute 


docker-compose stop ; docker-compose rm -f ; docker-compose down -v ; docker-compose up -d httpd php mysql redis ; ./start.bat


2b.) On Mac, execute


docker-compose stop ; docker-compose rm -f ; docker-compose down -v ; docker-compose up -d httpd php mysql redis ; sh start.sh


The latest staging branch was just cloned and deployed to data\www\rorlocal and the database was cloned from the staging environment.
The site is hosted locally at rorlocal.loc

3.) Open data\www\rorlocal folder with visual studio code, and begin development.
4.) Push changes to the git repo.

You can enter the php server shell by running sh shell.sh on mac or ./shell.bat on windows

Running the command from step 2 will destroy and rebuild everything, so make sure you have successfully pushed the changes.


Ready to deploy your local file changes to the staging site?

Login as the master user on cloudways and run the following command:

cd /home/852642.cloudwaysapps.com/upchssfppx/private_html && mkdir temp && cd temp && git clone git@github.com:storyroi/revivalofrevenue.com-WPComposer.git && cd revivalofrevenue.com-WPComposer && composer install && mv /home/852642.cloudwaysapps.com/upchssfppx/public_html/web/app/uploads/* /home/852642.cloudwaysapps.com/upchssfppx/private_html/temp/revivalofrevenue.com-WPComposer/web/app/uploads && rm -rf /home/852642.cloudwaysapps.com/upchssfppx/public_html/* && mv * /home/852642.cloudwaysapps.com/upchssfppx/public_html && rm -rf /home/852642.cloudwaysapps.com/upchssfppx/private_html/*
