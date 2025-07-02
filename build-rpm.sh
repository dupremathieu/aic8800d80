#!/bin/bash
set -e

mkdir -p /root/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
cp aic8800-1.0.0.tar.gz /root/rpmbuild/SOURCES/
cp aic8800.spec /root/rpmbuild/SPECS/
rpmbuild -ba /root/rpmbuild/SPECS/aic8800.spec
