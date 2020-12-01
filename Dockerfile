FROM centos:7

RUN yum -y update && \
    yum -y install epel-release centos-release-scl-rh
RUN yum -y update && \
    yum -y groupinstall "Development Tools" && \
    yum -y install net-tools rpmdevtools python-rpm-macros epel-rpm-macros devtoolset-9-gcc-c++

RUN yum -y install bluez-libs-devel bzip2-devel desktop-file-utils epel-rpm-macros expat-devel gdbm-devel gmp-devel libappstream-glib \
           libffi-devel libGL-devel libuuid-devel libX11-devel ncurses-devel openssl-devel readline-devel sqlite-devel tcl-devel \
           tix-devel tk-devel xz-devel zlib-devel systemtap-sdt-devel

RUN echo '%undefine _disable_source_fetch' > $HOME/.rpmmacros

RUN rpm --version
RUN rpmbuild --version
COPY python3 /repo/python3

RUN mkdir /root/rpmbuild
WORKDIR /root/rpmbuild

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
