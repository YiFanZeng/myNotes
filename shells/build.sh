#! /bin/bash

if [ $1 = "vdsm" ]; then
    pushd /home/zengyf/vdsm
    make distclean
    ./autogen.sh --system
    make rpm
#    make NOSE_EXCLUDE=testStressTest rpm
    popd > /dev/null
else
    pushd /home/zengyf/ovirt-node
    make distclean
    echo "=============make distclean over================="
    ./autogen.sh --with-image-minimizer
    make
    make dist
    echo "============ make dist over ====================="
    rpmbuild --nodeps -ta *.tar.gz
    echo "=========== make rpms over ======================"
    popd > /dev/null
fi
