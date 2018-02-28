#!/usr/bin/perl

use strict;
use LWP;

my $URL = "https://www.iplocation.net/find-ip-address";
my $useragent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
my $response = $useragent->get($URL);

print $response;

exit;
