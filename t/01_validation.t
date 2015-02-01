#!perl

# $Id: README 1103 2009-12-07 07:49:19Z corti $
# $Revision: 1103 $
# $HeadURL: https://svn.id.ethz.ch/nagios_plugins/check_updates/README $
# $Date: 2009-12-07 08:49:19 +0100 (Mon, 07 Dec 2009) $

use 5.00800;

use strict;
use warnings;

use File::Spec;
use Test::More tests => 3;

our $VERSION = '1.3.7';

my $check_updates = File::Spec->catfile(qw(blib script check_rbl));

require_ok($check_updates);

is( validate('127.0.0.1'), '127.0.0.1', 'numeric localhost' );
is( validate('localhost'), '127.0.0.1', 'localhost' );

1;
