# Class: mdns
#
# This class includes the common components for mdns installation
#
# Parameters:
#
# Actions:
#
# Sample Usage:
#   include mdns
#
class mdns {
  package {['avahi-daemon', 'avahi-utils']:}
}
