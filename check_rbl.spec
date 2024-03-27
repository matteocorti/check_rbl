%define version          1.7.3
%define release          0
%define sourcename       check_rbl
%define packagename      nagios-plugins-check-rbl
%define nagiospluginsdir %{_libdir}/nagios/plugins

# No binaries in this package
%define debug_package %{nil}

Summary:   check_rbl is a Nagios plugin to check if an SMTP server is blacklisted
Name:      %{packagename}
Obsoletes: check_rbl <= 100
Version:   %{version}
Release:   %{release}%{?dist}
License:   GPLv3+
Packager:  Matteo Corti <matteo@corti.li>
Group:     Applications/System
BuildRoot: %{_tmppath}/%{packagename}-%{version}-%{release}-root-%(%{__id_u} -n)
URL:       https://github.com/matteocorti/check_rbl
Source:    https://github.com/matteocorti/check_rbl/releases/download/v%{version}/check_rbl-%{version}.tar.gz

# Fedora build requirement (not needed for EPEL{4,5})
BuildRequires: perl(ExtUtils::MakeMaker)
# Fedora build requirement (EPEL >=9, Fedora >= 38)
BuildRequires: perl(FindBin) make

Requires: perl-Module-Install perl-Readonly perl-Monitoring-Plugin perl-Test-Simple perl-Perl-Critic rpm-build perl-Net-DNS perl-Net-IP perl-Data-Validate-IP perl-App-cpanminus perl-Capture-Tiny
Requires: perl(Data::Validate::Domain)

%description
check_rbl is a Nagios plugin to check if an SMTP server is blacklisted

%prep
%setup -q -n %{sourcename}-%{version}

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
%doc AUTHORS Changes NEWS README.md TODO COPYING COPYRIGHT
%{nagiospluginsdir}/%{sourcename}
%{_mandir}/man1/%{sourcename}.1*

%changelog
* Wed Mar 27 2024 Matteo Corti <matteo@corti.li> - 1.7.3-0
- Update to 1.7.3

* Thu Dec 28 2023 Peter Bieringer <pb@bieringer.de> - 1.7.2-1
- Add BuildRequirement for EPEL >= 9 and Fedora >= 38: perl(FindBin) make
- Add Requirement perl(Data::Validate::Domain)

* Thu Jun 29 2023 Matteo Corti <matteo@corti.li> - 1.7.2-0
- Update to 1.7.2

* Mon Apr 10 2023 Matteo Corti <matteo@corti.li> - 1.7.1-0
- Update to 1.7.1

* Mon Aug  8 2022 Matteo Corti <matteo@corti.li> - 1.7.0-1
- Updated the package dependencies

* Sun Aug  7 2022 Matteo Corti <matteo@corti.li> - 1.7.0-0
- Update to 1.7.0

* Thu May 12 2022 Matteo Corti <matteo@corti.li> - 1.6.4-0
- Update to 1.6.4

* Thu Dec 16 2021 Matteo Corti <matteo@corti.li> - 1.6.3-0
- Update to 1.6.3

* Tue Jun  1 2021 Matteo Corti <matteo@corti.li> - 1.6.2-0
- Update to 1.6.2
w
* Thu May 27 2021 Matteo Corti <matteo@corti.li> - 1.6.1-0
- Update to 1.6.1

* Thu May 27 2021 Matteo Corti <matteo@corti.li> - 1.6.0-0
- Update to 1.6.0

* Sun Jan  3 2021 Matteo Corti <matteo@corti.li> - 1.5.7-0
- Update to 1.5.7

* Mon Nov 30 2020 Matteo Corti <matteo@corti.li> - 1.5.6-0
- Update to 1.5.6

* Tue May 26 2020 Matteo Corti <matteo@corti.li> - 1.5.4-0
- Update to 1.5.4

* Tue Dec 24 2019 Matteo Corti <matteo@corti.li> - 1.5.3-0
- Update to 1.5.3

* Tue Dec 03 2019 Matteo Corti <matteo@corti.li> - 1.5.2-0
- Update to 1.5.2

* Mon Jun 03 2019 Matteo Corti <matteo@corti.li> - 1.5.0-0
- Update to 1.5.0

* Sun Jun 02 2019 Matteo Corti <matteo@corti.li> - 1.4.5-0
- Update to 1.4.5

* Thu Feb 28 2019 Matteo Corti <matteo@corti.li> - 1.4.4-0
- Update to 1.4.4

* Wed May 30 2018 Matteo Corti <matteo@corti.li> - 1.4.3-0
- Update to 1.4.3

* Sun May 27 2018 Matteo Corti <matteo@corti.li> - 1.4.2-0
- Update to 1.4.2

* Mon Jul 17 2017 Matteo Corti <matteo@corti.li> - 1.4.1-0
- Update to 1.4.1

* Tue Apr 18 2017 Matteo Corti <matteo@corti.li> - 1.4.0-0
- Update to 1.4.0

* Wed Dec 30 2015 Matteo Corti <matteo@corti.li> - 1.3.8-0
- Update to 1.3.8

* Sun Feb  1 2015 Matteo Corti <matteo@corti.li> - 1.3.7-0
- Update to 1.3.7 (using Monitoring::Plugins)

* Fri Dec  5 2014 Matteo Corti <matteo@corti.li> - 1.3.6-0
- Updated to 1.3.6 (removed dependency on Data::Dumper)

* Sat Sep 20 2014 Matteo Corti <matteo@corti.li> - 1.3.5-0
- Updated to 1.3.5

* Fri Sep 19 2014 Matteo Corti <matteo@corti.li> - 1.3.4-0
- Updated to 1.3.4

* Sat Aug  9 2014 Matteo Corti <matteo.corti@id.ethz.ch> - 1.3.3-0
- updated to 1.3.3

* Thu Jan 30 2014 Matteo Corti <matteo.corti@id.ethz.ch> - 1.3.2-0
- Dependencies and documentation update

* Mon Jul 11 2011 Matteo Corti <matteo.corti@id.ethz.ch> - 1.3.0-0
- Updated to 1.3.0 (whitelistings support)

* Tue Mar 22 2011 Matteo Corti <matteo.corti@id.ethz.ch> - 1.2.2-0
- Updated to 1.2.2 (bug fix) and renamed the package

* Mon Jul  5 2010 Matteo Corti <matteo.corti@id.ethz.ch> - 1.2.1-0
- Updated to 1.2.1 (bug fix)

* Thu Apr  8 2010 Matteo Corti <matteo.corti@id.ethz.ch> - 1.2.0-0
- Updated to 1.2.0 and improved the SPEC file

* Tue Oct 27 2009 Matteo Corti <matteo.corti@id.ethz.ch> - 1.1.0-0
- Updated to 1.1.0 (parallel checks)

* Thu Jan 22 2009 Matteo Corti <matteo.corti@id.ethz.ch> - 1.0.2-0
- --retry command line argument

* Tue Jan  6 2009 Matteo Corti <matteo.corti@id.ethz.ch> - 1.0.1-0
- Execution time in the performance data

* Mon Dec 29 2008 Matteo Corti <matteo.corti@id.ethz.ch> - 1.0.0-0
- Initial release

