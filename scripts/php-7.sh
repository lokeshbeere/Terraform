#!/bin/bash

# update packages 
sudo yum update -y

# installing packages
sudo yum install  httpd php7.4 -y 

# start the apache web server 
sudo service httpd start

# Use the chkconfig command to configure the Apache web server to start at each system boot.
sudo chkconfig httpd on

#  Adding user to the apache group.
sudo usermod -a -G apache ec2-user

# changing the ownership
sudo chown -R ec2-user:apache /var/www

# To add group write permissions and to set the group ID on future subdirectories, change the directory permissions of /var/www and its subdirectories.
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;

# To add group write permissions, recursively change the file permissions of /var/www and its subdirectories:
find /var/www -type f -exec sudo chmod 0664 {} \;

