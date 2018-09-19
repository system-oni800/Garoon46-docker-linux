FROM centos:centos7
LABEL MAINTAINER systemoni800

ENV DBADM __SET_YOUR_PASSWORD#1__
ENV GRNADM __SET_YOUR_PASSWORD#2__
ENV DBUPW __SET_YOUR_PASSWORD#3__

# Install Garoon-4.6.0

RUN yum update -y -q
RUN yum install -y -q httpd libaio libjpeg-turbo libpng libicu \
   perl perl-Data-Dumper wget unzip libic.x86_64 freetype.x86_64 expect spawn 
RUN yum clean all

## STEP2.
# Timezone
RUN localedef -f UTF-8 -i ja_JP ja_JP
RUN mv /etc/localtime /etc/localtime.org
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
#
RUN echo "KeepAlive Off" >> /etc/httpd/conf/httpd.conf
#
WORKDIR /root
ADD ./garoon-linux-x64.bin .
ADD ./grn-4.6-sp3-linux.bin .
ADD ./install_garoon.sh .
ADD ./install_sp.sh .
ADD ./setup.sh .
ADD ./session_handler.csp .
RUN chmod +x /root/install_garoon.sh
RUN sed -ri "s/__GRDBPW__/$DBADM/" /root/install_garoon.sh
RUN sed -ri "s/__GRNPW__/$GRNADM/" /root/install_garoon.sh
RUN sed -ri "s/__GRDBUSR__/$DBUPW/" /root/install_garoon.sh
RUN chmod +x /root/install_sp.sh
RUN chmod +x /root/setup.sh
RUN ls -al /root
#
# Mount host file 
VOLUME ["/var/garoon", "/var/logarchive"]
EXPOSE  80 
ENTRYPOINT [ "/sbin/init" ]
