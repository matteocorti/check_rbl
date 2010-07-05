################################################################################
# File version information:
# $Id: check_updates.spec 1126 2010-02-16 20:06:11Z corti $
# $Revision: 1126 $
# $HeadURL: https://svn.id.ethz.ch/nagios_plugins/check_updates/check_updates.spec $
# $Date: 2010-02-16 21:06:11 +0100 (Tue, 16 Feb 2010) $
################################################################################

%define version 1.2.1
%define release 0
%define name    check_rbl
%define nagiospluginsdir %{_libdir}/nagios/plugins

# No binaries in this package
%define debug_package %{nil}

Summary:   check_rbl is a Nagios plugin to check if an SMTP server is blacklisted
Name:      %{name}
Version:   %{version}
Release:   %{release}%{?dist}
License:   GPLv3+
Packager:  Matteo Corti <matteo.corti@id.ethz.ch>
Group:     Applications/System
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
URL:       https://trac.id.ethz.ch/projects/nagios_plugins/wiki/check_rbl
Source:    http://www.id.ethz.ch/people/allid_list/corti/%{name}-%{version}.tar.gz

# Fedora build requirement (not needed for EPEL{4,5})
BuildRequires: perl(ExtUtils::MakeMaker)

Requires:  nagios-plugins

%description
check_rbl is a Nagios plugin to check if an SMTP server is blacklisted

%prep
%setup -q

%build
%{__perl} Makefile.PL INSTALLDIRS=vendor \
    INSTALLSCRIPT=%{nagiospluginsdir} \
    INSTALLVENDORSCRIPT=%{nagiospluginsdir}
make %{?_smp_mflags}

%install
rm -rf %{buildroot}
make pure_install PERL_INSTALL_ROOT=%{buildroot}
find %{buildroot} -type f -name .packlist -exec rm -f {} \;
find %{buildroot} -type f -name "*.pod" -exec rm -f {} \;
find %{buildroot} -depth -type d -exec rmdir {} 2>/dev/null \;
%{_fixperms} %{buildroot}/*

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root,-)
%doc AUTHORS Changes NEWS README TODO COPYING COPYRIGHT
%{nagiospluginsdir}/%{name}
%{_mandir}/man1/%{name}.1*

%changelog
* Mon Jul  5 2010 Matteo Corti <matteo.corti@id.ethz.ch> - 1.2.1-0
- Updated to 1.2.1 (bug fix)

* Thu Apr  8 2010 Matteo Corti <matteo.corti@id.ethz.ch> - 1.2.0-0
- Updated to 1.2.0 and imprved the SPEC file

* Tue Oct 27 2009 Matteo Corti <matteo.corti@id.ethz.ch> - 1.1.0-0
- Updated to 1.1.0 (parallel checks)

* Thu Jan 22 2009 Matteo Corti <matteo.corti@id.ethz.ch> - 1.0.2-0
- --retry command line argument

* Tue Jan  6 2009 Matteo Corti <matteo.corti@id.ethz.ch> - 1.0.1-0
- Execution time in the performance data

* Mon Dec 29 2008 Matteo Corti <matteo.corti@id.ethz.ch> - 1.0.0-0
- Initial release

