cat > /etc/resolv.conf<<EOF
search \`$LISTDOMAINS\` 
nameserver \`$IP_NAMESERVER\`
EOF

/etc/init.d/samba start
net ads join -U $USERDOMAIN%$PASSDOMAIN 
/etc/init.d/winbind start
/usr/local/dirsamba && tail -f /dev/null


