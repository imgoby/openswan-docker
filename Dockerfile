FROM centos:7

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
ADD Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo

ADD ipsec.conf /etc/ipsec.conf
ADD ipsec.secrets /etc/ipsec.secrets

RUN yum install -y openswan   sysvinit-tools
RUN systemctl enable ipsec

RUN echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf && \
echo "net.ipv4.conf.default.rp_filter = 0" >> /etc/sysctl.conf && \
echo "net.ipv4.conf.all.rp_filter = 0" >> /etc/sysctl.conf && \
echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.conf && \
echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.conf && \
echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >> /etc/sysctl.conf && \
echo "net.ipv4.conf.default.log_martians = 0" >> /etc/sysctl.conf && \
echo "net.ipv4.conf.all.log_martians = 0" >> /etc/sysctl.conf && \
echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.conf && \
echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.conf && \
echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.conf

EXPOSE 500/udp 4500/udp

VOLUME ["/lib/modules"]

CMD ["/usr/sbin/init"]