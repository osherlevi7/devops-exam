#!/bin/bash

echo "Package-Name-For-Build: "
read pkg
echo "Version to create: "
read version
echo "Revision to build: "
read rev
echo "The target Architectore: "
read arch
echo "Maintainers: "
read maintainers
echo "Description of your package: "
read description

echo "-------------------------------------------------------------------"
mkdir "${pkg}_${version}-${rev}_${arch}"
echo "${pkg}_${version}-${rev}_${arch} has been created ✅"
mkdir -p ${pkg}_${version}-${rev}_${arch}/usr/local/bin
echo "/usr/local/bin has been created ✅"
cp ${pkg} ${pkg}_${version}-${rev}_${arch}/usr/local/bin
echo "The source code has been copyed to the pkg directory ✅"
mkdir ${pkg}_${version}-${rev}_${arch}/DEBIAN
echo "DEBIAN dir has been created ✅"
touch ${pkg}_${version}-${rev}_${arch}/DEBIAN/control
echo "The control file has been created ✅"
# echo the input of the package architecture to the control file
echo "Package: ${pkg}
  Version: ${version}
  Architecture: ${arch}
  Maintainer: ${maintainers}
  Description: ${description}" >> ${pkg}_${version}-${rev}_${arch}/DEBIAN/control
echo "-------------------------------------------------------------------"
#build the package 
echo "To build the package run the commad: dpkg-deb --build --root-owner-group "${pkg}_${version}-${rev}_${arch}""

echo "-------------------------------------------------------------------"
#installing the package
echo "To install the package run the commad: sudo dpkg -i "${pkg}_${version}-${rev}_${arch}""


echo "-------------------------------------------------------------------"
echo "successfully creating a deb package 🕺🏻"
exit 0
