#!perl

use 5.00800;

use strict;
use warnings;

use Test::More tests => 33;

our $VERSION = '1.5.4';

use_ok('Monitoring::Plugin');
can_ok( 'Monitoring::Plugin', 'new' );
can_ok( 'Monitoring::Plugin', 'nagios_exit' );
can_ok( 'Monitoring::Plugin', 'add_perfdata' );
can_ok( 'Monitoring::Plugin', 'perfdata' );

use_ok( 'Monitoring::Plugin' . '::Getopt' );
can_ok( 'Monitoring::Plugin' . '::Getopt', 'new' );
can_ok( 'Monitoring::Plugin' . '::Getopt', 'arg' );
can_ok( 'Monitoring::Plugin' . '::Getopt', 'getopts' );
can_ok( 'Monitoring::Plugin' . '::Getopt', 'get' );

use_ok( 'Monitoring::Plugin' . '::Threshold' );
can_ok( 'Monitoring::Plugin' . '::Threshold', 'new' );
can_ok( 'Monitoring::Plugin' . '::Threshold', 'set_thresholds' );

use_ok('IO::Select');
can_ok( 'IO::Select', 'new' );
can_ok( 'IO::Select', 'count' );
can_ok( 'IO::Select', 'can_read' );
can_ok( 'IO::Select', 'remove' );
can_ok( 'IO::Select', 'handles' );

use_ok('Net::DNS::Resolver');
can_ok( 'Net::DNS::Resolver', 'new' );
can_ok( 'Net::DNS::Resolver', 'can' );
can_ok( 'Net::DNS::Resolver', 'bgsend' );
can_ok( 'Net::DNS::Resolver', 'bgread' );

use_ok('English');
use_ok('Readonly');

use_ok('Net::IP');
can_ok( 'Net::IP', 'ip_expand_address' );

use_ok('Data::Validate::Domain');
can_ok( 'Data::Validate::Domain', 'is_hostname' );

use_ok('Data::Validate::IP');
can_ok( 'Data::Validate::IP', 'is_ipv4' );
can_ok( 'Data::Validate::IP', 'is_ipv6' );

