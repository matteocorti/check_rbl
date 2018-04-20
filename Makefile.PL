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
    'Data::Validate::Domain' => 0.12,
    'Data::Validate::IP'     => 0,
    'English'                => 0,
    'Net::DNS'               => 0,
    'Net::IP'                => 0,
    'Readonly'               => 0,
    'IO::Select'             => 0,
);

if( eval { require Monitoring::Plugin } ) {
    $prereqs{'Monitoring::Plugin'} = 0;
}
else {
    $prereqs{'Nagios::Plugin'} = 0;
}

if( eval { require Monitoring::Plugin::Threshold } ) {
    $prereqs{'Monitoring::Plugin::Threshold'} = 0;
}
else {
    $prereqs{'Nagios::Plugin::Threshold'} = 0;
}

if( eval { require Monitoring::Plugin::Getopt } ) {
    $prereqs{'Monitoring::Plugin::Getopt'} = 0;
}
else {
    $prereqs{'Nagios::Plugin::Getopt'} = 0;
}

# Net::DNS 1.03 is broken
my $ver = eval { require Net::DNS; $Net::DNS::VERSION };
if (!$ver || $ver eq '1.03') {
    warn 'Net::DNS is broken please downgrade until fixed. See https://rt.cpan.org/Ticket/Display.html?id=108745';
    $prereqs{'Nagios::Plugin::Getopt'} = '1.04';
}

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

