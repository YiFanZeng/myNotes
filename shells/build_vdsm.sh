#!/bin/bash

init_env()
{
    mv /root/rpmbuild /root/rpmbuild-$(date +%Y%m%d%H%M%S)
}

create_repo()
{
    mv /etc/yum.repos.d/* /tmp
    touch /etc/yum.repos.d/ctvn.repo
    echo "[node]" >> /etc/yum.repos.d/ctvn.repo
    echo "name=node" >> /etc/yum.repos.d/ctvn.repo
    echo "baseurl=http://192.168.0.237/Cerf/centos-build-env" >> /etc/yum.repos.d/ctvn.repo
    echo "gpgcheck=0" >> /etc/yum.repos.d/ctvn.repo
    echo "enables=1" >> /etc/yum.repos.d/ctvn.repo
}

yum_install()
{
    yum clean all
    yum install -y python-devel rpm-build createrepo selinux-policy-doc checkpolicy hardlink autoconf ltrace automake pykickstart make logrotate gcc libvirt-python python-devel python-nose python-pep8 rpm-build sanlock-python genisoimage python-ordereddict libselinux-python python-ethtool m2crypto python-dmidecode python-netaddr python-argparse git bridge-utils libguestfs-tools-c pyparted openssl libnl libtool gettext-devel livecd-tools appliance-tools appliance-tools-minimizer pyflakes python-pthreading redhat-rpm-config sanlock-devel wget vim
}

git_clone()
{
    vdsm_dir=/root
    pushd $vdsm_dir
    git clone git://192.168.0.200/vdsm -b ct3.2
    popd > /dev/null
}

build_vdsm()
{
    build_dir=/root/vdsm
    pushd $build_dir
    echo $build_dir
    ./autogen.sh --system
    make rpm
    popd > /dev/null
}

install_vdsm()
{
    echo "install_vdsm(), do it by yourself..."
}

init_env | tee -a build_vdsm_log
create_repo | tee -a build_vdsm_log
yum_install | tee -a build_vdsm_log
#git_clone | tee -a build_vdsm_log
build_vdsm | tee -a build_vdsm_log
install_vdsm | tee build_vdsm_log
