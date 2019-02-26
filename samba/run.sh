#!/bin/bash
sed -i  s"/SOASAMBA/$SOASAMBA/" /etc/samba/smb.conf
/etc/init.d/samba start
