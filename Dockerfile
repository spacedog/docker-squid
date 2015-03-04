FROM        abaranov/base
MAINTAINER  abaranov@linux.com


ADD         squid.yml /ansible/squid.yml
RUN         ansible-playbook /ansible/squid.yml
RUN         rm -rf /ansible
ADD         squid.conf /etc/squid/squid.conf

EXPOSE      3128
CMD         ["squid", "-d"]
