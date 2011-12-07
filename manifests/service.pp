# Type: mdns::service
#
# This type publishes a service using avahi mdns
#
# Parameters:
#   $name:
#     The service name.
#     May make use of wildcards such as %h to be replaced with the hostname
#   $type:
#     The service type.
#     This should be a valid mdns subtype and type
#     e.g. _myservice._tcp or _myservice._udp
#   $port:
#     The port that the service listens on
#   $txt:
#     An array of txt records to store with the service record
#     Defaults to no txt records
#
# Actions:
#   Creates a service file named with the name passed in
#   Also installs the avahi daemon if not there already via the mdns class
#
# Sample Usage:
#   mdns::service {'myservice-%h':
#     type => '_myservice._tcp', 
#     port => '1234';
#   }
#
#  or
#
#   mdns::service {'myservice-%h':
#     type => '_myservice._tcp', 
#     port => '1234',
#     txt  => ['some text', 'some more text'];
#   }
#
define mdns::service (
  $type,
  $port,
  $txt=[]
  ){

  $mdns_service_name = $name
  $mdns_service_type = $type
  $mdns_service_port = $port
  $mdns_service_txt  = $txt

  include mdns

  file {"/etc/avahi/services/${mdns_service_name}.service":
    ensure  => 'present',
    content => template('mdns/avahi-service'),
    require => Class['mdns'];
  }

}
