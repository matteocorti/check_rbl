# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# File version information:
# $Id: AUTHORS 1103 2009-12-07 07:49:19Z corti $
# $Revision: 1103 $
# $HeadURL: https://svn.id.ethz.ch/nagios_plugins/check_updates/AUTHORS $
# $Date: 2009-12-07 08:49:19 +0100 (Mon, 07 Dec 2009) $

##############################################################################
# Define metadata (we read it from the binary)

name         'check_rbl';
version_from 'check_rbl';
all_from     'check_rbl.pod';

##############################################################################
# Specific dependencies

include 'version';

requires 'Nagios::Plugin::Getopt'    => 0;
requires 'Nagios::Plugin'            => 0;
requires 'Nagios::Plugin::Threshold' => 0;
requires 'Net::DNS'                  => 0;
requires 'Readonly'                  => 0;
requires 'IO::Select'                => 0;

requires 'version'                   => 0;

install_script  'check_rbl';

WriteMakefile(
    INSTALLSCRIPT        => '/usr/lib/nagios/plugins/contrib',
    INSTALLSITESCRIPT    => '/usr/lib/nagios/plugins/contrib',
    MAN1PODS             => { 'check_rbl.pod' =>'blib/man1/check_rbl.1', },
    MAN3PODS             => { },
);

