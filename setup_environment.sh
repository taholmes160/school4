#!/bin/bash

# Update and upgrade packages
sudo apt-get update
sudo apt-get upgrade -y

# Remove unnecessary packages
sudo apt-get autoremove -y

# Install mariadb-server and configure
sudo apt-get install -y mariadb-server
sudo service mariadb start
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'T3t0npack@160';"

# Install PHP, Adminer, and configure Apache
sudo apt-get install -y php php-mysql
sudo apt-get install -y wget
sudo wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php
sudo sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
sudo service apache2 restart

# Install Python environment
sudo apt install python3.10-venv -y
python3 -m venv venv
source venv/bin/activate
sudo apt-get install -y python3-pip pkg-config

# Install Python dependencies from requirements.txt
pip3 install -r requirements.txt
