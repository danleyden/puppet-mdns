module Puppet::Parser::Functions
  newfunction(:get_hosts_for_mdns_service, :type => :rvalue, :doc => <<-'ENDHEREDOC') do |args|
    returns an array of addresses advertising the requested service

    This function takes one argument: the name of the test script
    ENDHEREDOC
    raise ArgumentError, ("get_hosts_for_mdns_service(): wrong number of arguments (#{args.length}; must be 1)") if args.length != 1


    # get the results for the service and remove IPv6 and summary lines
    hostlines = %x{avahi-browse -trp #{args[0]}}.split(/\n/).delete_if {|line| line =~ /^\+/ || line =~ /IPv6/}

    results = []
    # loop through and get the addresses
    hostlines.each {|line|
      results.push(line[/([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+;[0-9]+);/, 1].sub(';', ':'))
    }
    results
  end



end

