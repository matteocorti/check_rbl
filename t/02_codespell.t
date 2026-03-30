#!/usr/bin/env perl

use strict;
use warnings;

use English qw( -no_match_vars );
use IPC::Cmd qw( can_run );
use IPC::Open3;
use POSIX qw( WEXITSTATUS );
use Symbol qw( gensym );
use Test::More;

our $VERSION = '0.001';

sub run_codespell {
    
    my $stderr = gensym();

    my $pid = open3(
        undef,
        my $stdout,
        $stderr,
        'codespell',
    );

    my $out = do { local $INPUT_RECORD_SEPARATOR = undef; <$stdout> };
    my $err = do { local $INPUT_RECORD_SEPARATOR = undef; <$stderr> };

    waitpid $pid, 0;
    my $exit_code = WEXITSTATUS($CHILD_ERROR);

    return ($exit_code, $out . $err);
}


# Ensure codespell is available
my $codespell = can_run('codespell');

if (!$codespell) {
    plan skip_all => 'codespell is not installed';
    exit;
}

# Run codespell
my ( $exit_code, $output ) = run_codespell();

if ($exit_code == 0) {
    pass('No spelling errors found by codespell');
} else {
    fail('Spelling errors found by codespell');
    diag($output);
}

done_testing();
