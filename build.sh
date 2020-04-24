#!/bin/bash

echo "CWD = $(pwd)"

if [ -z "${WORKSPACE}" ]; then
    WORKSPACE="$(pwd)"
fi

rm -rf BUILD BUILDROOT RPMS SRPMS
mkdir BUILD BUILDROOT RPMS SRPMS

pushd SPECS
for SPEC in *.spec; do
  sudo yum-builddep -y ${SPEC}
  echo "Building ${SPEC}"
  time rpmbuild --define "_topdir ${WORKSPACE}" -ba ${SPEC}
done
popd


