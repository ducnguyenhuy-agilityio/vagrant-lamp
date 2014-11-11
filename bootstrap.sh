#!/usr/bin/env bash

# Update Ubuntu
sudo apt-get update

# Install vim
sudo apt-get install -y vim

# Set up Apache
sudo apt-get install -y apache2

# Add ServerName to httpd.conf
echo "ServerName localhost" | sudo tee -a /etc/apache2/httpd.conf

# Install PHP5.4
sudo apt-get install -y python-software-properties
sudo add-apt-repository ppa:ondrej/php5-oldstable -y
sudo apt-get update
sudo apt-get install -y php5

# Install MySQL with PHP 5, set password to 'root'
echo "mysql-server-5.1 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.1 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get install -y mysql-server libapache2-mod-auth-mysql php5-mysql

# Install PHP5-mcrypt lib
apt-get install -y php5-mcrypt

# Install PHP5-GD lib
apt-get install -y php5-gd

# Restart Apache
sudo service apache2 restart

# Create PHP test file
echo '
<?php
/* Connect to an ODBC database using driver invocation */
$dsn = "mysql:dbname=mysql;host=localhost";
$user = "root";
$password = "root";

try {
    $dbh = new PDO($dsn, $user, $password);
    echo "DB Connection works!";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
};

phpinfo(); ?>' | tee /vagrant/phpinfo.php