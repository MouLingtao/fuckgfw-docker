FROM centos:centos6
MAINTAINER MouLingtao <smile@himlt.com>

RUN yum -y install epel-release
RUN yum -y install crontabs openssh-server pwgen
RUN rm -f /etc/ssh/ssh_host_*
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN sed -i "s/UseDNS.*/UseDNS no/g" /etc/ssh/sshd_config

RUN mkdir -p /root/.ssh
RUN chmod 700 /root/.ssh
RUN touch /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8NER29op8k8y5w7zKxaqF6YJq60yUFmgFd5z2UIAKa7hWHB/oM8AK//tuf0H+jQY3CLqZdPLzrgUlNMJo2t+VhjWqqlboZuIZCmksE7t48fzxLecowc3rKUqcxpQUlzQ4+kVkSMt5PP376RW49mWylInLANl0nHXdLJfyrZyW7S4rcWsYvjetykB18Rc8JtCF4V+W+zcBpFgVjc9ikU3Age8DBeIRnQAJwx7blDxllsZMd0cAfdTSd86LvJuEiZ/ZigYkJKp6QHBn1pnSYhymA1rdzydjgUxeOL28c1NcusZZBbjxPWcoYdIgnC4aXGFfmEsgKEASuKE/Io72BylJ oreo@oreo-mbp.local" >> /root/.ssh/authorized_keys

ADD qtunnel.bin /usr/local/bin/qtunnel
ADD qtunnel.service /etc/init.d/qtunnel
ADD check_service.sh /usr/local/bin/check_service
ADD run.sh /run.sh

RUN chmod +x /usr/local/bin/qtunnel
RUN chmod +x /etc/init.d/qtunnel
RUN chmod +x /usr/local/bin/check_service
RUN chmod +x /run.sh

RUN chkconfig qtunnel on
RUN chkconfig crond on
RUN chkconfig sshd on

RUN echo "*/1 * * * * root /usr/local/bin/check_service" >> /etc/crontab
RUN echo "0 5 * * * root /sbin/service qtunnel restart" >> /etc/crontab

EXPOSE 22 8123
CMD ["/run.sh"]