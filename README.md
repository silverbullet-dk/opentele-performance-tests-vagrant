Vagrant box creation for OpenTele Server performance tests
===============
Project for creating [Vagrant](http://www.vagrantup.com/) boxes for use in OpenTele Server performance tests.

How to build and run
--------------------
Make sure you have Vagrant installed.
Run `vagrant up`

After vagrant has finished running export a new vagrant box by running
`vagrant package --base OpenTele_performance_test_box --output opentele-performance-test.box`

The new box is now ready to be used in performance tests.


Current setup
-----------
The current setup creates an Ubuntu based machine with the following products
* Apache Tomcat 7
* MySQL
* Oracle JDK 7