#!/usr/bin/env bash

# Update Ubuntu
sudo apt-get update

# Install vim
sudo apt-get install -y vim

# Set up Apache
sudo apt-get install -y apache2

# Remove /var/www default
sudo rm -rf /var/www

# Symlink /vagrant to /var/www
sudo ln -fs /vagrant /var/www

# Add ServerName to httpd.conf
echo "ServerName localhost" | sudo tee -a /etc/apache2/httpd.conf

# Install PHP
sudo apt-get install -y libapache2-mod-php5

# Install MySQL with PHP 5, set password to 'root'
echo "mysql-server-5.1 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.1 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get install -y mysql-server libapache2-mod-auth-mysql php5-mysql

# Restart Apache
sudo service apache2 restart

# Create test.php file
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

phpinfo(); ?>' | tee /vagrant/test.php