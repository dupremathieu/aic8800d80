%global dkms_name aic8800
%global dkms_version 1.0.0

Name:    %{dkms_name}-dkms
Version: 1.0.0
Release: 1%{?dist}
Summary: AIC8800D80 Linux Driver

License: GPL-2.0
URL:     https://github.com/shenmintao/aic8800d80
Source0: %{dkms_name}-%{dkms_version}.tar.gz

BuildRequires:  dkms

%description
This package contains the AIC8800D80 Linux Driver for DKMS.

%prep
%setup -q -n %{dkms_name}-%{dkms_version}

%build
# Nothing to do here

%install
# Copy the source to the dkms directory
mkdir -p %{buildroot}/usr/src/%{dkms_name}-%{dkms_version}
cp -a . %{buildroot}/usr/src/%{dkms_name}-%{dkms_version}

# Copy the dkms.conf file
cp dkms.conf %{buildroot}/usr/src/%{dkms_name}-%{dkms_version}/dkms.conf

%files
/usr/src/%{dkms_name}-%{dkms_version}

%changelog
* Wed Jul 02 2025 Mathieu Dupré <mathieu.dupre@savoirfairelinux.com> - 1.0.0-1
- Initial release
