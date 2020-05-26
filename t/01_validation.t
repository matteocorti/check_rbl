#!perl

use 5.00800;

use strict;
use warnings;

use File::Spec;
use Test::More tests => 1;

our $VERSION = '1.4.0';

my $check_rbl = File::Spec->catfile(qw(blib script check_rbl));

require_ok($check_rbl);

1;
