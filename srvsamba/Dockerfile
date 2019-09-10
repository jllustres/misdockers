FROM nexus.goya.local:5000/debian:stretch-slim
###FROM debian:stretch-slim

MAINTAINER Jose L Navarro Lustres

RUN apt-get update 
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -yq samba winbind krb5-config libnss-winbind
RUN mkdir /shared

COPY s*.conf /etc/samba/
COPY krb5.conf /etc/
COPY nsswitch.conf /etc/
COPY run.sh /root/

VOLUME /shared
EXPOSE 137/udp 138/udp 139 445

# Para que se quede corriendo. El script de inicio de samba hace “exit 0”
###CMD /etc/init.d/samba start && tail -f /dev/null 
CMD /bin/bash /root/run.sh && tail -f /dev/null 




