#!/bin/sh
set -e

mkdir -p /root/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
if [ "$1" = 'python3' ]; then
    echo 'Building python3...'
    cp -rv /repo/python3/* SOURCES/
    mv -v SOURCES/*.spec SPECS/
    sed -n -e 1,358p SPECS/python3.spec > SPECS/~python3.spec
    spectool -g -R -D SPECS/~python3.spec && if [ "$?" ]; then cat /tmp/spectool_*/stderr_*; fi
    rpmbuild --target x86_64 -ba SPECS/python3.spec
else
    exec "$@"
fi
