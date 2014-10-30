Vagrant LAMP
============

Vagrant basic box with LAMP (Linux, Apache, MySql and PHP) on Ubuntu 12.04 LTS

Requirements
------------
* VirtualBox <http://www.virtualbox.com>
* Vagrant <http://www.vagrantup.com>
* Git <http://git-scm.com/>
* Vagrant HostsUpdater plugin <https://github.com/cogitatio/vagrant-hostsupdater>

Usage
-----

### Startup
	$ git clone https://github.com/ducnguyenhuy/vagrant-lamp.git
	$ cd vagrant-lamp
	$ vagrant up

That is pretty simple.

### Connecting

#### Apache
The Apache server is available at <http://vagrant-lamp.dev> or <http://vagrant-lamp.lc>

#### MySQL
Externally the MySQL server is available at port 8889, and when running on the VM it is available as a socket or at port 3306 as usual.
Username: root
Password: root

### Run PHP test file
Enter http://vagrant-lamp.dev/test.php or http://vagrant-lamp.lc/test.php in your browser to see PHP information.

### Access guest machine
	$ vagrant ssh

Technical Details
-----------------
* Ubuntu 12.04 LTS
* Apache 2
* PHP 5.3
* MySQL 5.5

I'm using the base Ubuntu 12.04 box from Vagrant. If you don't already have it downloaded
the Vagrantfile has been configured to do it for you.

The web root is located in the vagrant-lamp directory and you can install your files there.