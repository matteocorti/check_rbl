# Load the Module::Install bundled in ./inc/
use lib '.'; # added since from Perl 5.26 '.' is no more in @INC
use inc::Module::Install;

##############################################################################
# Define metadata (we read it from the binary)

name              'check_rbl';
version_from      'check_rbl';

##############################################################################
# Specific dependencies

my %prereqs = (
    'Capture::Tiny'                 => 0,
    'Data::Validate::Domain'        => 0.12,
    'Data::Validate::IP'            => 0,
    'English'                       => 0,
    'Net::DNS'                      => 0,
    'Net::IP'                       => 0,
    'Readonly'                      => 0,
    'Socket'                        => 0,
    'IO::Select'                    => 0,
    'Monitoring::Plugin'            => 0,
    'Monitoring::Plugin::Threshold' => 0,
    'Monitoring::Plugin::Getopt'    => 0,
);

# Net::DNS 1.03 is broken
my $ver = eval { require Net::DNS; $Net::DNS::VERSION };
if (!$ver || $ver eq '1.03') {
    warn 'Net::DNS is broken please downgrade until fixed. See https://rt.cpan.org/Ticket/Display.html?id=108745';
    $prereqs{'Net::DNS'} = '1.04';
}

# https://metacpan.org/pod/release/DAGOLDEN/CPAN-Meta-2.142690/lib/CPAN/Meta/Spec.pm#license
license 'gpl_3';

install_script  'check_rbl';

auto_install;

tests 't/*.t';

WriteMakefile(
    PREREQ_PM            => \%prereqs,
    INSTALLSCRIPT        => '/usr/lib/nagios/plugins/contrib',
    INSTALLSITESCRIPT    => '/usr/lib/nagios/plugins/contrib',
    MAN1PODS             => { 'check_rbl.pod' =>'blib/man1/check_rbl.1', },
    MAN3PODS             => { },    
);

