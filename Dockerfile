ARG CENTOS_VERSION=7
FROM centos:${CENTOS_VERSION}

RUN source /etc/os-release ; if [[ ${VERSION_ID} -eq "8" ]]; then dnf -y install dnf-plugins-core && yum config-manager --set-enabled PowerTools ; fi

RUN yum -y update && yum install -y rpm-build yum-utils gcc-c++ sudo epel-release

LABEL \
  org.opencontainers.image.authors="Adam Deacon" \
  org.opencontainers.image.description="This docker image uses CentOS to build RPMS" \
  org.opencontainers.image.licenses="GNUv2" \
  org.opencontainers.image.source="https://github.com/adamjdeacon/rpmbuild" \
  org.opencontainers.image.title="CentOS with rpmbuild and related packages" \
  org.opencontainers.image.version="${DOCKER_VERSION} with rpmbuild"

RUN groupadd --gid 1000 rpmbuild \
  && useradd --uid 1000 --gid rpmbuild --shell /bin/bash --create-home rpmbuild
RUN echo ' rpmbuild ALL=(ALL)   NOPASSWD:ALL' >> /etc/sudoers

USER rpmbuild

VOLUME /home/rpmbuild
WORKDIR /home/rpmbuild

COPY build.sh /

CMD ["/build.sh"]

