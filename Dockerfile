ARG CENTOS_VERSION=7
FROM centos:${CENTOS_VERSION}

RUN yum -y update ; \
yum install -y rpm-build yum-utils gcc-c++ 


LABEL \
  org.opencontainers.image.authors="Adam Deacon" \
  org.opencontainers.image.description="This docker image uses CentOS to build RPMS" \
  org.opencontainers.image.licenses="GNUv2" \
  org.opencontainers.image.source="https://github.com/adamjdeacon/rpmbuild" \
  org.opencontainers.image.title="CentOS with rpmbuild and related packages" \
  org.opencontainers.image.version="${DOCKER_VERSION} with rpmbuild"
