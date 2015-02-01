#!perl

# $Id: README 1103 2009-12-07 07:49:19Z corti $
# $Revision: 1103 $
# $HeadURL: https://svn.id.ethz.ch/nagios_plugins/check_updates/README $
# $Date: 2009-12-07 08:49:19 +0100 (Mon, 07 Dec 2009) $

use 5.00800;

use strict;
use warnings;

use Test::More tests => 23;

our $VERSION = '1.3.7';

use_ok('Monitoring::Plugin');
can_ok( 'Monitoring::Plugin', 'new' );
can_ok( 'Monitoring::Plugin', 'nagios_exit' );
can_ok( 'Monitoring::Plugin', 'add_perfdata' );

use_ok('Monitoring::Plugin::Getopt');
can_ok( 'Monitoring::Plugin::Getopt', 'new' );
can_ok( 'Monitoring::Plugin::Getopt', 'arg' );
can_ok( 'Monitoring::Plugin::Getopt', 'getopts' );
can_ok( 'Monitoring::Plugin::Getopt', 'get' );

use_ok('Monitoring::Plugin::Threshold');
can_ok( 'Monitoring::Plugin::Threshold', 'new' );
can_ok( 'Monitoring::Plugin::Threshold', 'set_thresholds' );

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
