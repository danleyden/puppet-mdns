===================
mdns puppet module
===================

Author: Daniel Leyden

Supports the installation of avahi and publishing of services


Usage
======

Service
-------
To declare (expose an mdns service)::

     mdns::service {
       'myservice-%h': # %h is your hostname
         type => '_myservice._tcp', # The mdns service type
         port => '1234'; # The port your service is listening on
     }

.. note:: Make sure your service definition contains a unique qulifier - puppet
          will not like having two instances with the same name

Using the information
---------------------

To use (consume a service)::

    # To get an array of all the services of a specific type:
    $a_variable = get_hosts_for_mdns_service('_myservice._tcp')

