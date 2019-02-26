FROM nexus.goya.local:5000/debian:stretch-slim
###FROM debian:stretch-slim

MAINTAINER Jose L Navarro Lustres

RUN apt-get update && apt-get install -y samba

RUN mkdir /shared

COPY *.conf /etc/samba/
COPY *.sh /usr/local/bin/

###RUN ["chmod", "+x", "/usr/local/bin/run.sh"]

VOLUME /config /shared

###EXPOSE 137/udp 138/udp 139 445

EXPOSE 445
EXPOSE 135
EXPOSE 138
EXPOSE 139
EXPOSE 137/udp
EXPOSE 138/udp

###ENV MIVAR=HOLA

CMD /usr/local/bin/run.sh && tail -f /dev/null

###CMD /etc/init.d/samba start && tail -f /dev/null

###ENTRYPOINT ["/bin/bash","/usr/local/bin/run.sh", "tail -f /dev/null"]


