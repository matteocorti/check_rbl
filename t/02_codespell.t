#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;

# Ensure codespell is available
my $codespell = `which codespell`;
if (!$codespell) {
    plan skip_all => 'codespell is not installed';
    exit;
}

# Run codespell
my $output = `codespell   2>&1`;
if ($? == 0) {
    pass('No spelling errors found by codespell');
} else {
    fail('Spelling errors found by codespell');
    diag($output);
}

done_testing();
