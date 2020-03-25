Name:         steiger
Version:      0.1.0
Release:      6%{?dist}
Summary:      Conjunto de utilitários para monitoramento de servidores.
Group:        System
License:      GPLv3+
URL:          https://github.com/StrangeSafetywall/steiger
Source0:      https://github.com/StrangeSafetywall/steiger/archive/v0.1.0.tar.gz
Vendor:       Stranger Safetywall, Inc.
Packager:     Rafael Ribeiro (nokcode)

Requires:     bash

BuildArch:    noarch
BuildRoot:    ~/rpmbuild/

%description
Com alguns comandos você pode fazer o steiger reportar o status de
seus servidores. Nesta versão do steiger, apenas o monitoramento do
senderscore está disponível.

%global debug_package %{nil}

%prep

%setup -q -n %{name}-%{version}

%build

%install
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT

%clean
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

%files
%license LICENSE
%defattr(-,root,root,-)
%{_sysconfdir}/steiger.conf
%{_bindir}/steiger
%{_bindir}/steiger-functions
%{_bindir}/steiger-senderscore
