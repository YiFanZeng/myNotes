#!/bin/bash

sudo scp Michael@192.168.70.76:~/ctmate* /home/zengyf/ctvm-rpms/
sudo rm -rf /storage/creator/Cerf/centos-dvd/ctvm-rpms/
sudo cp -R /home/zengyf/ctvm-rpms/ /storage/creator/Cerf/centos-dvd/
pushd /storage/creator/Cerf/centos-dvd/
sudo createrepo  -g repodata/b4e0b9342ef85d3059ff095fa7f140f654c2cb492837de689a58c581207d9632-c6-x86_64-comps.xml .
echo "createrepo over----------"
echo "you can make ctvm.iso"

pushd /home/zengyf/ctvn-live
sudo LANG=C livecd-creator --config=ctvm.ks --fslabel=ctvm-image-3.2.2916

