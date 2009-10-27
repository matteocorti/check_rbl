%define version 1.1.0
%define release 0
%define name    check_rbl
%define _prefix /usr/lib/nagios/plugins/contrib

Summary:   check_rbl is a Nagios plugin to check if an SMTP server is blacklisted
Name:      %{name}
Version:   %{version}
Release:   %{release}
License:   GPL
Packager:  Matteo Corti <matteo.corti@id.ethz.ch>
Group:     Applications/System
BuildRoot: %{_tmppath}/%{name}-%{version}-root
Source:    http://www.id.ethz.ch/people/allid_list/corti/%{name}-%{version}.tar.gz
BuildArch: noarch

Requires: perl

%description
check_rbl is a Nagios plugin to check if an SMTP server is blacklisted

%prep
%setup -q

%build
%__perl Makefile.PL  INSTALLSCRIPT=%{buildroot}%{_prefix} INSTALLSITEMAN3DIR=%{buildroot}/usr/share/man/man3 INSTALLSITESCRIPT=%{buildroot}%{_prefix}
make

%install
make install

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-, root, root, 0644)
%doc AUTHORS Changes NEWS README INSTALL TODO COPYING VERSION
%attr(0755, root, root) %{_prefix}/%{name}
%attr(0755, root, root) /usr/share/man/man3/%{name}.3pm.gz

%changelog
* Tue Oct 27 2009 Matteo Corti <matteo.corti@id.ethz.ch> - 1.1.0-0
- Updated to 1.1.0 (parallel checks)

* Thu Jan 22 2009 Matteo Corti <matteo.corti@id.ethz.ch> - 1.0.2-0
- --retry command line argument

* Tue Jan  6 2009 Matteo Corti <matteo.corti@id.ethz.ch> - 1.0.1-0
- Execution time in the performance data

* Mon Dec 29 2008 Matteo Corti <matteo.corti@id.ethz.ch> - 1.0.0-0
- Initial release

