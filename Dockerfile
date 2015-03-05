FROM        abaranov/base
MAINTAINER  abaranov@linux.com


ADD         squid.yml /ansible/squid.yml
RUN         ansible-playbook /ansible/squid.yml
RUN         rm -rf /ansible
ADD         squid.conf /etc/squid/squid.conf
RUN         tar -xzf /var/squidGuard/blacklists.tar.gz -C /var/squidGuard
ADD         squidGuard.conf /etc/squid/squidGuard.conf
RUN         squidGuard -C all

EXPOSE      3128
CMD         ["squid", "-N"]
