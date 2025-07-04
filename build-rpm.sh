#!/bin/bash
set -ex

mkdir -p {BUILD,RPMS,SOURCES,SPECS,SRPMS}
cp -r fw drivers  /root/rpmbuild/SOURCES/
cp aic8800.spec /root/rpmbuild/SPECS/
rpmbuild -ba /root/rpmbuild/SPECS/aic8800.spec
